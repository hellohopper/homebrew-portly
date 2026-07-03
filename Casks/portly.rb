cask "portly" do
  version "0.5.0"
  sha256 "56c2f66bf37d18278ec9fbd9dbf1de7f0a7587f8835bcf29ecf434c8c8025f0d"

  url "https://github.com/hellohopper/portly/releases/download/v#{version}/Portly.dmg"
  name "Portly"
  desc "Menu bar app for tracking local port usage"
  homepage "https://github.com/hellohopper/portly"

  auto_updates false

  app "Portly.app"
  binary "#{appdir}/Portly.app/Contents/MacOS/portly-cli", target: "portly"

  # Releases are ad-hoc signed (no notarization), so strip quarantine or
  # Gatekeeper blocks the first launch of both the app and the CLI.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Portly.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.hellohopper.portly.plist",
  ]
end
