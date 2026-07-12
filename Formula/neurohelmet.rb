# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.0/neurohelmet-0.3.0-universal-apple-darwin.zip"
    sha256 "edf7ca894245f5a73b0e866446a508178faba1658500cda71aa88886dbc18d83"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.0/neurohelmet-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78a7490b64a94d2696f132ed9a50a6ab287ac70b4c0c71b0e4aac250e4c3ead7"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.0/neurohelmet-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f66f0fed602cb79a27e57ea24d457984d560b100f4661ce63eff38ec93983692"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
