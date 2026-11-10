class BrewSafe < Formula
  desc "Release-age-gated Homebrew install, outdated, and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.3.0/brew-safe_0.3.0.tar.gz"
  sha256 "b4ce481e44dfb221a59795b8fee1ac89cdc1f37b7d507d5b8b67c9e47388e09c"
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
