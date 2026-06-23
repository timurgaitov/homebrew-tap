cask "cbp" do
  version "1.0.1"
  sha256 "b29a4b3485db2fe7ca6974d40c54362d272ac18e0cebdaae14ae0ae01cf7e4fc"

  url "https://github.com/timurgaitov/cbp/releases/download/v#{version}/cbp-#{version}.zip"
  name "cbp"
  desc "Spotlight-style Touch ID password quick-copy (menu-bar app, global hotkey)"
  homepage "https://github.com/timurgaitov/cbp"

  depends_on macos: :ventura

  app "cbp.app"

  # The app is ad-hoc signed (not notarized). Homebrew quarantines downloads,
  # which Gatekeeper would block on first launch; strip it so cbp opens cleanly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/cbp.app"],
                   sudo: false
  end

  caveats <<~EOS
    cbp is ad-hoc signed, not notarized. The quarantine flag is removed on
    install so it launches directly. If macOS still blocks it, allow it under
    System Settings > Privacy & Security > Open Anyway.

    Launch cbp once to add the menu-bar icon, then use Add Password and press
    your hotkey (default Cmd-Backslash).
  EOS
end
