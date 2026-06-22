class Cage < Formula
  desc "Load 1Password Environments with age-protected service account tokens"
  homepage "https://github.com/2h2d-co/cage"
  url "https://github.com/2h2d-co/cage/releases/download/v0.0.9/cage_0.0.9_darwin_arm64.tar.gz"
  sha256 "be924e534f77fea8b5fceccd0f518e329fb1cd86dc1dd1d719e80a020036a0df"
  license "MIT"
  version "0.0.9"

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
