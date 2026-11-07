cask "nimbus" do
  version "1.3.0"
  sha256 "2eb205f2848d22e3ac1de41eed9a80dabe9c5913d0a0b417d9270669fc444b87"

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
