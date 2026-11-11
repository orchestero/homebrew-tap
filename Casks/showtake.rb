cask "showtake" do
  version "0.1.0-beta.4,5"
  sha256 "d2f153b28083c5f24415c3b0a410da2beea85b9eefc9e3889c53fa3dd10da7a0"

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
