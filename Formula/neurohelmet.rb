# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.2.0/neurohelmet-0.2.0-universal-apple-darwin.zip"
    sha256 "e6bab03db0abedff41f0245ecc1bd53d2a381dbdf50679aac1d4ce8339e8f393"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.2.0/neurohelmet-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a18d6dac7fd7855f204ce1f04e7e0cd64c0c5250ddc9fe87a8924ffb800c1484"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.2.0/neurohelmet-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d07b136a5e72b5f04d5a00aa54e1395e388f9e7bd54c2b0d6f2c8686fcf453d"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
