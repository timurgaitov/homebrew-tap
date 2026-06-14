cask "csvedit" do
  version "1.3.0"
  sha256 "8947eecd79ef93de54990ca95051102ff497561831360a8f3a9989a06017b608"

  url "https://github.com/timurgaitov/csvedit/releases/download/v#{version}/csvedit-#{version}.zip"
  name "csvedit"
  desc "Fast native CSV editor for macOS"
  homepage "https://github.com/timurgaitov/csvedit"

  depends_on macos: :monterey

  app "csvedit.app"

  caveats <<~EOS
    csvedit is ad-hoc signed, not notarized. If macOS blocks the first
    launch, either reinstall with:
      brew reinstall --cask --no-quarantine csvedit
    or allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
