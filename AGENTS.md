# homebrew-tap Project Instructions

homebrew-tap is the Homebrew tap for 2h2d.co tools and formulas.

## Conventions

- Format commit messages according to [Conventional Commits](https://www.conventionalcommits.org/).
- Treat formula updates as references to upstream releases; do not create matching release commits or tags in this tap.
- For each formula update:
  - update the URL, `version` or `revision`, and `sha256` together;
  - verify the checksum against the upstream release asset;
  - run Homebrew style and audit checks;
  - test installation when the local environment permits it.
