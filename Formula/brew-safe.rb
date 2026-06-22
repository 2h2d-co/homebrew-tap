class BrewSafe < Formula
  desc "Release-age-gated Homebrew outdated and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.1.0/brew-safe_0.1.0.tar.gz"
  sha256 "34f96537efced7d371593d0faa67b790cc51613d87e96c3711faee675ef326c2"
  license "MIT"
  revision 2

  def install
    libexec.install "cmd", "lib"

    (bin/"brew-safe-outdated.rb").write <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      #: *`safe-outdated`* [<options>] [<formula>|<cask> ...]
      #:
      #: List outdated formulae and casks that are safe to upgrade based on release date.
      #:
      require "#{libexec}/cmd/safe-outdated"
      Homebrew::Cmd::SafeOutdated.new.run
    RUBY

    (bin/"brew-safe-upgrade.rb").write <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      #: *`safe-upgrade`* [<options>] [<formula>|<cask> ...]
      #:
      #: Upgrade outdated formulae and casks that pass the release date safety gate.
      #:
      require "#{libexec}/cmd/safe-upgrade"
      Homebrew::Cmd::SafeUpgrade.new.run
    RUBY

    chmod 0755, bin/"brew-safe-outdated.rb"
    chmod 0755, bin/"brew-safe-upgrade.rb"
  end

  test do
    assert_match "safe-outdated", shell_output("brew safe-outdated --help")
    assert_match "safe-upgrade", shell_output("brew safe-upgrade --help")
  end
end
