class BrewSafe < Formula
  desc "Release-age-gated Homebrew install, outdated, and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.2.6/brew-safe_0.2.6.tar.gz"
  sha256 "4e104de76f38d23e12a4299b12220a55ad9016b0b1645eac524a8f233c78ba24"
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
