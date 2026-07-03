cask "portly" do
  version "0.4.0"
  sha256 "20a0e648bf92c644be4e214a9d41ff74373ac2c70c4999400632d00bf9d19447"

  url "https://github.com/hellohopper/portly/releases/download/v#{version}/Portly.dmg"
  name "Portly"
  desc "Menu bar app for tracking local port usage"
  homepage "https://github.com/hellohopper/portly"

  auto_updates false

  app "Portly.app"

  zap trash: [
    "~/Library/Preferences/dev.hellohopper.portly.plist",
  ]
end
