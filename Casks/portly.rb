cask "portly" do
  version "0.5.1"
  sha256 "4c066916bbd2de81fb5cfedc49e1c0f3f268f64bfb0ed23db0880da495d0a50d"

  url "https://github.com/hellohopper/portly/releases/download/v#{version}/Portly.dmg"
  name "Portly"
  desc "Menu bar app for tracking local port usage"
  homepage "https://github.com/hellohopper/portly"

  auto_updates false

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

  zap trash: [
    "~/Library/Preferences/dev.hellohopper.portly.plist",
  ]
end
