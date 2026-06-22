class Dots < Formula
  desc "Minimal, copy-based dotfiles manager"
  homepage "https://github.com/2h2d-co/dots"
  url "https://github.com/2h2d-co/dots/releases/download/v0.0.1/dots_0.0.1_darwin_arm64.tar.gz"
  version "0.0.1"
  sha256 "753f474fdf9236a3c0fe05c7eb11c3bbdc2190d0073e6e03ba0ee968cf09793a"
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
