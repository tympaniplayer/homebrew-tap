# Template for the Homebrew formula. On each tagged release,
# .github/workflows/release.yml fills in the __PLACEHOLDERS__ (version + SHA256s)
# and pushes the result to <owner>/homebrew-tap as Formula/neurohelmet.rb.
# Don't edit the copy in the tap by hand — it's overwritten every release.
class Neurohelmet < Formula
  desc "Keyboard-driven terminal BattleTech record-sheet tracker"
  homepage "https://github.com/tympaniplayer/neurohelmet"
  version "0.3.3"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.3/neurohelmet-0.3.3-universal-apple-darwin.zip"
    sha256 "b3a6e7e4e89cade75fd38f722e7eb2431dcb3405114b5fbc53c461929570da2a"
  end

  on_linux do
    on_intel do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.3/neurohelmet-0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e751c281d8ddaa1cb054cafbe56f207ae13b7b21fc4c1fc378970475e035181a"
    end
    on_arm do
      url "https://github.com/tympaniplayer/neurohelmet/releases/download/v0.3.3/neurohelmet-0.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a812c8a49f04f4920a07c79c52fede9f99295978cb10a041cf40de46377e015e"
    end
  end

  def install
    bin.install "neurohelmet"
  end

  test do
    assert_match "loaded", shell_output("#{bin}/neurohelmet --selftest")
  end
end
