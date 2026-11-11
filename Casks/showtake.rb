cask "showtake" do
  version "0.1.0-beta.13,14"
  sha256 "1077636eb72459cecf8de336211350c8aea24bbdb00268f77f2c1406b218345e"

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
