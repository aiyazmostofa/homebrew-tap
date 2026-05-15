# Homebrew Tap
Personal tap tailored for Linux.
Great for (and mostly tested on) [Universal Blue spins of Linux](https://universal-blue.org/).

## Usage
Do `brew tap aiyazmostofa/tap` and then `brew install <formula>`.

## Packages
### Emacs
Builds Emacs from source, using Brew libraries.
It is tailored for me personally.
However you are free to contribute.

Some drawbacks:

- Extremely heavy dependencies (for example, all of LLVM and GCC)
- Not configurable (it has just enough for me to be happy)
- Only exposes the Emacs binary (not Emacs client)
- No systemd service
- Only tested by me

### Nix
Repackages my own [redistribution of Nix(Static)](https://github.com/aiyazmostofa/nix).

## License
[MIT License](./LICENSE)
