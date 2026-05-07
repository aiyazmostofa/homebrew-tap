# TODO:
# Integrate systemd service
# Add desktop integration without forcing Brew in $PATH/$XDG_DATA_DIR

class Emacs < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs"
  url "https://ftpmirror.gnu.org/emacs/emacs-30.2.tar.xz"
  sha256 "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
  license "GPL-3.0-or-later"

  depends_on "pkgconf" => :build

  depends_on "gcc"
  depends_on "gnutls"
  depends_on "gtk+3"
  depends_on "libgccjit"
  depends_on "tree-sitter"

  def install
    args = %w[
      --with-pgtk
      --with-tree-sitter
      --with-native-compilation=aot
      --with-json
    ]

    # Get libgccjit detection
    libgccjit = Formula["libgccjit"]
    libgccjit_lib = libgccjit.opt_lib/"gcc/current"
    ENV.append "LDFLAGS", "-Wl,-rpath,#{libgccjit_lib}"
    ENV.append "LIBRARY_PATH", libgccjit_lib
    ENV.append "CPATH", libgccjit.opt_include

    # Hack to make this build on immutable distros (where /home -> /var/home)
    ENV["HOMEBREW_PREFIX"] = HOMEBREW_PREFIX.realpath

    # Copied this from
    # 'https://github.com/NixOS/nixpkgs/blob/c9d1572336ba8ba2936add51ea4615a6bc1effaa/pkgs/applications/editors/emacs/make-emacs.nix'
    # to make the generated dump file hermetic.
    inreplace "src/Makefile.in", "RUN_TEMACS = ./temacs", "RUN_TEMACS = env -i ./temacs"

    # Tree sitter patches
    inreplace "src/treesit.c", "ts_language_version", "ts_language_abi_version"

    system "./configure", *args, *std_configure_args
    system "make", "install"
  end
end
