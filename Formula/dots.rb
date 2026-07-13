class Dots < Formula
  desc "Minimal, copy-based dotfiles manager"
  homepage "https://github.com/2h2d-co/dots"
  url "https://github.com/2h2d-co/dots/releases/download/v0.0.5/dots_0.0.5_darwin_arm64.tar.gz"
  version "0.0.5"
  sha256 "1ab4b3af5df4c842cc5e8fe43a9e375e5179f3cd3831ee9ecc4a4463ed98b68f"
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
