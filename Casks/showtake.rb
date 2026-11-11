cask "showtake" do
  version "0.1.0-beta.12,13"
  sha256 "a4f36a847b5b67ac387336b4568539776350d92eda78ff1d17b67c8376861bcc"

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
