cask 'flutter-sdk' do
  version '0.3.2'
  sha256 '33154ca2dedd0d3c657668fff1b0edcb4c3f08e7c89fd12c5487dd4e5e32e496'

  # storage.googleapis.com/flutter_infra/releases/beta/macos was verified as official when first introduced to the cask
  url "https://storage.googleapis.com/flutter_infra/releases/beta/macos/flutter_macos_v#{version}-beta.zip"
  name 'Flutter SDK'
  homepage 'https://flutter.io/'

  binary 'flutter/bin/flutter'
end
