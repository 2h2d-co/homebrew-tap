class Cage < Formula
  desc "Load 1Password Environments with age-protected service account tokens"
  homepage "https://github.com/2h2d-co/cage"
  url "https://github.com/2h2d-co/cage/releases/download/v0.0.12/cage_0.0.12_darwin_arm64.tar.gz"
  sha256 "04e6e57cad824b3676587cf09be26b0117bbd0e4b34943f26e0fec428ebfbea5"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "cage"
    man1.install "docs/man/cage.1" if (buildpath/"docs/man/cage.1").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cage --version")
  end
end
