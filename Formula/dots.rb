class Dots < Formula
  desc "Minimal, copy-based dotfiles manager"
  homepage "https://github.com/2h2d-co/dots"
  url "https://github.com/2h2d-co/dots/releases/download/v0.0.10/dots_0.0.10_darwin_arm64.tar.gz"
  sha256 "dc6aa63f06230a59fd5d768480d6b0001056a2a0bdde761c5675d790ec5426e0"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "dots"
    man1.install Dir["docs/man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dots --version")
  end
end
