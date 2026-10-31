cask "nimbus" do
  version "1.1.1"
  sha256 "3fb28a1dd2cc3a4fbfb965ee4405c255dfb1f3eab0c6fd2e6ee4b90a45e1cab5"

  url "https://github.com/Dearonski/Nimbus/releases/download/v#{version}/Nimbus-#{version}.dmg"
  name "Nimbus"
  desc "Native SoundCloud client"
  homepage "https://github.com/Dearonski/Nimbus"

  livecheck do
    url "https://github.com/Dearonski/Nimbus/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Nimbus.app"

  zap trash: [
    "~/Library/Application Scripts/io.github.dearonski.Nimbus",
    "~/Library/Containers/io.github.dearonski.Nimbus",
  ]

  caveats <<~EOS
    Nimbus is signed but not notarised by Apple. On the first launch macOS will
    refuse to open it: click Done, then System Settings → Privacy & Security →
    Open Anyway. Updates arrive through the app itself after that.
  EOS
end
