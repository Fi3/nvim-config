### NVIM CONFIG

```
cd ~/.config
git clone https://github.com/Fi3/nvim-config.git nvim
```
Open Nvim and then: `:PlugInstall`

## Rust deps

* rustup component add rustfmt

Binary have to be installed for each toolchain used, for example nightly and stable.
When a component is broken on nightly [this](https://github.com/rust-lang/rls#error-component-rls-is-unavailable-for-download-nightly) is the fastest fix. Also see [641](https://github.com/rust-lang/rls/issues/641).


Install rust-analyzer:
just [download the binary](https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary) and put it in your path.

## Haskell deps

* https://github.com/Infinisil/all-hies  `cachix use all-hies && nix-env -iA selection --arg selector 'p: { inherit (p) ghc864 ghc863 ghc843; }' -f https://github.com/infinisil/all-hies /tarball/master` this will install for ghc 8.6.4 8.6.3 and 8.4.3
* update cabal: cabal install Cabal cabal-install
* use ghcup to manage ghc versions https://github.com/haskell/ghcup-hs

When an haskell project is create a file named `hie.yaml` must be put in the root of the project.
https://github.com/mpickering/hie-bios/blob/master/README.md
https://github.com/haskell/haskell-ide-engine/issues/1621#issuecomment-581067134
`lib:<project-name>` ok `exe:<project-name>`

## Codeium config
Run `:Codeium Auth` to set up the plugin and start using Codeium.

## Search
Fuzzy search files ordered byt proximity with ctr p, need:

### proximity-sort
https://github.com/jonhoo/proximity-sort
Install with  `cargo install proximity-sort`


### fzf and fd
pacman -S fzf fd
