class Deno < Formula
  desc "A secure JavaScript/TypeScript runtime built with V8, Rust, and Tokio"
  homepage "https://deno.land/"
  url "https://github.com/denoland/deno/releases/download/v0.3.3/deno_osx_x64.gz"
  version "0.3.3"
  sha256 "2f8cffd86b603c63af751783a2cb3589c70cc5c5d00fb345c59f3177e5204601"

  def install
    bin.install "deno"
  end

  test do
    system "false"
  end
end
