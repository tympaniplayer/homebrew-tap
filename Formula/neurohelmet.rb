# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.0/neurohelmet-0.1.0-universal-apple-darwin.zip"
    sha256 "82960e3ae9a639609ba0fa08ff4ade5c4bf61d9f1c27a811bba71a2ecdda2b43"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.0/neurohelmet-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1fd3049816d6e63b66de1fc49aafeb5c3e562b5a821ae2cb16f53e45df155a6d"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.0/neurohelmet-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a3d9e927f114ae5e72eafbc96d44aa9d25e3ba837f4bdfdca698af1d0e7d6e2"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
