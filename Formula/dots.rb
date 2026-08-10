class Dots < Formula
  desc "Minimal, copy-based dotfiles manager"
  homepage "https://github.com/2h2d-co/dots"
  url "https://github.com/2h2d-co/dots/releases/download/v0.0.6/dots_0.0.6_darwin_arm64.tar.gz"
  sha256 "79336ce01f5434fdc13d98f60a1c9fb4da4c2da6f86e33d2689929609e2aba3f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "dots"
    man1.install Dir["docs/man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dots --version")
  end
end
