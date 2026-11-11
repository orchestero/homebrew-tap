cask "showtake@beta" do
  version "0.1.0-beta.7,8"
  sha256 "d2fa38a0e8122119ff9b8b39f5ecb41220a738de53e872c14763e448d97b6cca"

  url "https://downloads.showtake.app/#{version.csv.first}/#{version.csv.second}/ShowTake_#{version.csv.first}_#{version.csv.second}.dmg"
  name "ShowTake"
  desc "Beta of the Mac app and MCP server that films polished demos of your apps"
  homepage "https://showtake.app/"

  livecheck do
    url "https://downloads.showtake.app/appcast/beta.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :tahoe"
  conflicts_with cask: "showtake"

  app "ShowTake.app"

  zap trash: [
    "~/Library/Application Support/ShowTake",
    "~/Library/Caches/app.showtake.ShowTake",
    "~/Library/HTTPStorages/app.showtake.ShowTake",
    "~/Library/Preferences/app.showtake.ShowTake.plist",
  ]
end
