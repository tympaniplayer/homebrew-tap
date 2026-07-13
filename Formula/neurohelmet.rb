# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.1/neurohelmet-0.3.1-universal-apple-darwin.zip"
    sha256 "1eb21ed4d11fef1fdfaddf6353e54b93504e81885d422868d4e4f38c688fad17"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.1/neurohelmet-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7f14d5bdb2582c887c4980a1f04e133ec0b482b03ede1cd61d7952eb432f8f7"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.1/neurohelmet-0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10e167b6a0e3961dad0f37adc1d18615245c55ff51a62214e081b3ccf1340059"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
