class Emacs < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs"
  url "https://ftpmirror.gnu.org/emacs/emacs-30.2.tar.xz"
  sha256 "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
  license "GPL-3.0-or-later"

  depends_on "pkgconf" => :build

  depends_on "gnutls"
  depends_on "gtk+3"
  depends_on "tree-sitter"

  def install
    # Hack to make this build on immutable distros (where /home -> /var/home)
    ENV["HOMEBREW_PREFIX"] = HOMEBREW_PREFIX.realpath

    # Tree sitter patches
    inreplace "src/treesit.c", "ts_language_version", "ts_language_abi_version"

    system "./configure", "--with-pgtk", "--with-tree-sitter", *std_configure_args
    system "make", "install"
  end
end
