cask "clipboardpass" do
  version "1.0.3"
  sha256 "8c1c79d02426e16763939edd77cf6a66c607ff2992aa34a721032b3f3859ee8a"

  url "https://github.com/timurgaitov/clipboardpass/releases/download/v#{version}/clipboardpass-#{version}.zip"
  name "clipboardpass"
  desc "Menu-bar password manager for when the built-in Passwords app does not fit"
  homepage "https://github.com/timurgaitov/clipboardpass"

  depends_on macos: :ventura

  app "clipboardpass.app"

  # The app is ad-hoc signed (not notarized). Homebrew quarantines downloads,
  # which Gatekeeper would block on first launch; strip it so it opens cleanly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/clipboardpass.app"],
                   sudo: false
  end

  caveats <<~EOS
    clipboardpass is ad-hoc signed, not notarized. The quarantine flag is
    removed on install so it launches directly. If macOS still blocks it, allow
    it under System Settings > Privacy & Security > Open Anyway.

    Launch clipboardpass once to add the menu-bar icon, then use Add Password
    and press your hotkey (default Cmd-Backslash).
  EOS
end
