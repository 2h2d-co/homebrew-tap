class BrewSafe < Formula
  desc "Release-age-gated Homebrew install, outdated, and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.2.7/brew-safe_0.2.7.tar.gz"
  sha256 "a13b6ad854b0046c9be4b57b00c5ffb5380da27137db3c27bbe8e63d2aec5db9"
  license "MIT"

  def install
    libexec.install "cmd", "lib"
    # The release ships these wrappers. Homebrew reads their help from their `#:` comments.
    bin.install "bin/brew-safe-install.rb", "bin/brew-safe-outdated.rb", "bin/brew-safe-upgrade.rb"
  end

  test do
    assert_match "--dry-run", shell_output("brew safe-install --help")
    assert_match "--before", shell_output("brew safe-outdated --help")
    assert_match "--before", shell_output("brew safe-upgrade --help")
  end
end
