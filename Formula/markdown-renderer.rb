class MarkdownRenderer < Formula
  desc "A standalone Markdown renderer for the terminal"
  homepage "https://github.com/MichaelMure/mdr"
  url "https://github.com/MichaelMure/mdr/releases/download/v0.2.2/mdr_darwin_amd64"
  version "0.2.2"
  sha256 "b521bc12d96311e4c98124203c712121f84d1562f5836fb022e22636f40e7584"

  def install
    bin.install "mdr_darwin_amd64" => "mdr"
  end

  test do
    system "false"
  end
end
