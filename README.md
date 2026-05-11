# Homebrew Tap
Personal tap tailored for Linux.
Great for (and mostly tested on) [Universal Blue spins of Linux](https://universal-blue.org/).

## Usage
Do `brew tap aiyazmostofa/tap` and then `brew install <formula>`.

## Packages
### Emacs
Builds Emacs from source, using Brew libraries.

Some drawbacks:

- Extremely heavy dependencies (for example, all of LLVM and GCC)
- Desktop entry needs `.linuxbrew/bin` in `PATH`
- Desktop entry needs `.linuxbrew/share` in `XDG_DATA_DIRS`
- Not configurable (it has just enough for me to be happy)
- Only tested by me

### Nix
Repackages my own [redistribution of Nix(Static)](https://github.com/aiyazmostofa/nix).

## License
[MIT License](./LICENSE)
