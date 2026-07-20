# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.3.4"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.4/neurohelmet-0.3.4-universal-apple-darwin.zip"
    sha256 "d6072c16a5b5d6cd3b433fee933541f7e6c8a3fa4a0e0b0127f4d616b5c2056a"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.4/neurohelmet-0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44b65c43748598b5e0dc4cebcf1db231839a9109ffa25dfa0bcaf73c942a8e45"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.4/neurohelmet-0.3.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66acc914f656321c9e5291a6dae51897b8f113b19677996f47029e47074569dc"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
