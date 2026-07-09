# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.1/neurohelmet-0.1.1-universal-apple-darwin.zip"
    sha256 "60b49736e11c13f56b4958ccf55afc3b6cf4a0672a52aef920d67781f8e40dbb"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.1/neurohelmet-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7baca282a75d15f3d307a2a8b9fa5b1fe33759baa85f1d424ba6c0fe6e22b20"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.1.1/neurohelmet-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f06613b7313c20d9ba6b88dd7999e006846c03c5fe8f3ac7d2ea304b0e7d6f3b"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
