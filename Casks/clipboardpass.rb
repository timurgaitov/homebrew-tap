cask "clipboardpass" do
  version "1.0.1"
  sha256 "c4b935a1b36373456930bde9e7086e951246bf36da552c0993cce1f7c9edea22"

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
