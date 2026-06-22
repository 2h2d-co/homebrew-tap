class Cage < Formula
  desc "Load 1Password Environments with age-protected service account tokens"
  homepage "https://github.com/2h2d-co/cage"
  url "https://github.com/2h2d-co/cage/releases/download/v0.0.8/cage_0.0.8_darwin_arm64.tar.gz"
  sha256 "dd8a2f6ee65d943f1ce75dd12bfe8283fe43351c3d988b6c7432a5159b0cda31"
  license "MIT"
  version "0.0.8"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "cage"
    man1.install "docs/man/cage.1" if (buildpath/"docs/man/cage.1").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cage --version")
  end
end
