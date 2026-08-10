class BrewSafe < Formula
  desc "Release-age-gated Homebrew install, outdated, and upgrade commands"
  homepage "https://github.com/2h2d-co/homebrew-safe"
  url "https://github.com/2h2d-co/homebrew-safe/releases/download/v0.2.1/brew-safe_0.2.1.tar.gz"
  sha256 "4cc82e2a1c54002bd34bdae87926634b3b7c54fa7250b767b9276a197a47b76c"
  license "MIT"

  def install
    libexec.install "cmd", "lib"

    (bin/"brew-safe-install.rb").write <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      #: *`safe-install`* [<options>] <formula> [...]
      #:
      #: Install formulae at versions that pass the release date safety gate.
      #:
      require "#{libexec}/cmd/safe-install"
      Homebrew::Cmd::SafeInstall.new.run
    RUBY

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

    chmod 0755, bin/"brew-safe-install.rb"
    chmod 0755, bin/"brew-safe-outdated.rb"
    chmod 0755, bin/"brew-safe-upgrade.rb"
  end

  test do
    assert_match "safe-install", shell_output("brew safe-install --help")
    assert_match "safe-outdated", shell_output("brew safe-outdated --help")
    assert_match "safe-upgrade", shell_output("brew safe-upgrade --help")
  end
end
