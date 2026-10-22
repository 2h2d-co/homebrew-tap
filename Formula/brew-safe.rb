class BrewSafe < Formula
  desc "Release-age-gated Homebrew install, outdated, and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.2.5/brew-safe_0.2.5.tar.gz"
  sha256 "2ef8028b53a5c5ddacb4fb4ad4c4e0b45a6de80ff5c2d0d4dc99e75edc7411a3"
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
