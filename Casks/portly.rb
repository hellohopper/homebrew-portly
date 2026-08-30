cask "portly" do
  version "0.7.0"
  sha256 "6f6f64b002b459eb0d3ebde154f0370a8ae78026a28f38cd25a264d65cfdb5bf"

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
