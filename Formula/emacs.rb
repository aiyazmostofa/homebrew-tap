class Emacs < Formula
  desc "Emacs"
  homepage "https://www.gnu.org/software/emacs"
  url "https://ftpmirror.gnu.org/emacs/emacs-30.2.tar.xz"
  sha256 "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
  license "GPL-3.0-or-later"

  depends_on "gtk+3"
  depends_on "gnutls"

  def install
    system "./configure", "--with-pgtk", *std_configure_args
    system "make", "install"
  end
end
