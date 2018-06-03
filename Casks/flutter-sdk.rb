cask 'flutter-sdk' do
  version '0.4.4'
  sha256 '6cfb32cf331f03a01de73e9daa51bf6ca3ee38b605c8543548bf9417f3ee300f'

  # storage.googleapis.com/flutter_infra/releases/beta/macos was verified as official when first introduced to the cask
  url "https://storage.googleapis.com/flutter_infra/releases/beta/macos/flutter_macos_v#{version}-beta.zip"
  name 'Flutter SDK'
  homepage 'https://flutter.io/'

  # shim script (https://github.com/caskroom/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/flutter.wrapper.sh"
  binary shimscript, target: 'flutter'

  preflight do
    # Use warm cache: $sdk/.pub-cache
    # https://github.com/flutter/flutter/blob/master/bin/flutter#L97-L99
    # https://github.com/flutter/flutter/blob/master/dev/bots/prepare_package.dart#L212
    # https://github.com/flutter/flutter/blob/master/dev/bots/prepare_package.dart#L322
    IO.write shimscript, <<~EOS
      #!/bin/sh
      TOOL="#{staged_path}/flutter/bin/flutter"
      if [[ -d "#{HOMEBREW_PREFIX}/share/flutter-sdk/.pub-cache" ]]; then
        PUB_CACHE="#{HOMEBREW_PREFIX}/share/flutter-sdk/.pub-cache" exec "$TOOL" "$@"
      else
        exec "$TOOL" "$@"
      fi
    EOS
  end
  
  postflight do
    FileUtils.ln_sf("#{staged_path}/flutter", "#{HOMEBREW_PREFIX}/share/flutter-sdk")
  end

  uninstall_postflight do
    FileUtils.rm("#{HOMEBREW_PREFIX}/share/flutter-sdk")
  end

  caveats do
    <<~EOS
      You may want to add to your profile:

        'export FLUTTER_SDK_ROOT="#{HOMEBREW_PREFIX}/share/flutter-sdk"'
    EOS
  end
  
end
