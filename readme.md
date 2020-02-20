### NVIM CONFIG

```
cd ~/.config
git clone https://github.com/Fi3/nvim-config.git nvim
```

Intsall rust-racer: https://github.com/racer-rust/racer

Install ctags `dnf install ctags`

Follow https://github.com/majutsushi/tagbar/wiki#rust

Open Nvim and then: `:PlugInstall`
After: `:CocInstall coc-rls`

## Rust deps

* rustup component add rustfmt
* rustup component add rls rust-analysis rust-src

Binary have to be installed for each toolchain used, for example nightly and stable.
When a component is broken on nightly [this](https://github.com/rust-lang/rls#error-component-rls-is-unavailable-for-download-nightly) is the fastest fix. Also see [641](https://github.com/rust-lang/rls/issues/641).
