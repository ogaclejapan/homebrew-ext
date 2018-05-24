class Drive < Formula
  desc "Google Drive client for the commandline"
  homepage "https://github.com/odeke-em/drive"
  url "https://github.com/odeke-em/drive/releases/download/v0.3.9/drive_darwin"
  version "0.3.9"
  sha256 "e739b7661d529a894cb992d339bc4e77b5849cf29cb93ba9b2df2f4079871639"

  def install
    bin.install "drive_darwin" => "drive"
  end

  test do
    system "false"
  end
end
