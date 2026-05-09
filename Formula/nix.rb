class Nix < Formula
  desc "Purely functional package manager"
  homepage "https://nixos.org"
  url "https://github.com/aiyazmostofa/nix/releases/download/2.34.7/nix-2.34.7.tar.gz"
  sha256 "7387d2b12f0e725a4e00d4e2adb28325fedb6ec69c6728efecd5f3b0d7e55cd8"
  license "LGPL-2.1-only"

  bottle do
    root_url "https://github.com/aiyazmostofa/homebrew-tap/releases/download/nix-2.34.7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d20a170f34a338b0f489939a22510f976f33a6f08b5a34373ca603864d17edbc"
  end

  def install
    bin.install Dir["bin/*"]
    share.install Dir["share/*"]
  end

  test do
    system bin/"nix", "--version"
  end
end
