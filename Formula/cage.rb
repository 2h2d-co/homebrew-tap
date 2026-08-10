class Cage < Formula
  desc "Load 1Password Environments with age-protected service account tokens"
  homepage "https://github.com/2h2d-co/cage"
  url "https://github.com/2h2d-co/cage/releases/download/v0.0.10/cage_0.0.10_darwin_arm64.tar.gz"
  sha256 "815a74cc3f2511772c64008ee879d091b0055071b6d009fea979f9c8ef1b19f3"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "cage"
    man1.install "docs/man/cage.1" if (buildpath/"docs/man/cage.1").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cage --version")
  end
end
