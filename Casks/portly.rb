cask "portly" do
  version "0.2.0"
  sha256 "47e6164b4338b671f9ba6adf579cbfd7544778df4df0fe4d644e6c3ffaf2546d"

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
