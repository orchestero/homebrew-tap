cask "showtake" do
  version "1.6.0,26"
  sha256 "a02de44842a6993e2e1384ea7e5f99c6020f48c8b416916dc65d5fea8cd7daaa"

  url "https://downloads.showtake.app/#{version.csv.first}/#{version.csv.second}/ShowTake_#{version.csv.first}_#{version.csv.second}.dmg"
  name "ShowTake"
  desc "Mac app and MCP server that films polished demos of your apps"
  homepage "https://showtake.app/"

  livecheck do
    url "https://downloads.showtake.app/appcast/stable.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :tahoe"
  conflicts_with cask: "showtake@beta"

  app "ShowTake.app"

  zap trash: [
    "~/Library/Application Support/ShowTake",
    "~/Library/Caches/app.showtake.ShowTake",
    "~/Library/HTTPStorages/app.showtake.ShowTake",
    "~/Library/Preferences/app.showtake.ShowTake.plist",
  ]
end
