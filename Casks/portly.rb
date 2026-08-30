cask "portly" do
  version "0.5.2"
  sha256 "1454868e8095e09505cbc02ca67e9348ff8af2a5f3c84a6214ba77a0269eed24"

  url "https://github.com/hellohopper/portly/releases/download/v#{version}/Portly.dmg"
  name "Portly"
  desc "Menu bar app for tracking local port usage"
  homepage "https://github.com/hellohopper/portly"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Portly.app"
  binary "#{appdir}/Portly.app/Contents/MacOS/portly-cli", target: "portly"

  # Releases are ad-hoc signed (no notarization). Two consequences on install:
  # quarantine makes Gatekeeper block the first launch, and on Apple Silicon an
  # ad-hoc signature minted on the CI machine stalls dyld's policy assessment
  # forever on other machines. Strip quarantine and re-sign locally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Portly.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Portly.app"]
  end

  uninstall quit: "dev.hellohopper.portly"

  zap trash: [
    "~/Library/Application Support/Portly",
    "~/Library/Preferences/dev.hellohopper.portly.plist",
    "~/Library/Saved Application State/dev.hellohopper.portly.savedState",
  ]
end
