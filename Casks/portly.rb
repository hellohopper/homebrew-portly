cask "portly" do
  version "0.3.1"
  sha256 "22109b0831cadd475510c3dfcf2079828d514f8cba548fddcd687baf6c3b6a09"

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
