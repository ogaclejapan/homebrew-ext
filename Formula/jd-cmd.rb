class JdCmd < Formula
  desc "Command-line Java Decompiler"
  homepage "https://github.com/kwart/jd-cmd"
  url "https://github.com/kwart/jd-cmd/releases/download/jd-cmd-0.9.2.Final/jd-cli-0.9.2-dist.zip"
  sha256 "059c498e14510f588fede1f0230c6fb62e9e7ef34d8efd80ddee61a57d083404"

  depends_on :java => "1.6+"

  def install
    libexec.install "jd-cli.jar"
    bin.write_jar_script libexec/"jd-cli.jar", "jd-cli"
  end

  test do
    system "false"
  end
end
