cask "portly" do
  version "0.1.0"
  sha256 "bba112364db81198fbbd506c0bad35869634eeff558d5e126f1109ffd1db1cc0"

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
