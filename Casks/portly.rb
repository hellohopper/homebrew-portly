cask "portly" do
  version "0.4.1"
  sha256 "a89be2ae5d14fbd785e7383b579b972cf74cae03fcf5bc1f8fdfc1069751385d"

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
