# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.1.2"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.2/neurohelmet-0.1.2-universal-apple-darwin.zip"
    sha256 "b8c2ba752e64fb839ff19ae00aa7b376facced3f2a4960db3ec882ce9584f78f"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.2/neurohelmet-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e8b84ba951ecd2f85209d443059822046503262b2c2061c60578701239eaf37"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.2/neurohelmet-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2f568cd82eb935a894df3e362acdcb85fbb975f8dcc83782831785c7e428909"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
