# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.2/neurohelmet-0.3.2-universal-apple-darwin.zip"
    sha256 "e47649da1db52687d21b15bc385b7b7805d56881eca1ef1ec164ad8ffc0b1920"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.2/neurohelmet-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac022a0a3609a1bb2d71a819eb6637bd0e9d396a6184df1d2cdb66b53069313e"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.2/neurohelmet-0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c711d6a64e53c32e9ebecbb8e3daefad53d100e1a0d9cafefde85cd795a769e"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
