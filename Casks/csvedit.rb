cask "csvedit" do
  version "1.2.0"
  sha256 "3691f3526e818919f1e2dafaf1805b80112f9c71d145086876b53b3ae29e73ed"

  url "https://github.com/timurgaitov/csvedit/releases/download/v#{version}/csvedit-#{version}.zip"
  name "csvedit"
  desc "Fast native CSV editor for macOS"
  homepage "https://github.com/timurgaitov/csvedit"

  depends_on macos: ">= :monterey"

  app "csvedit.app"

  caveats <<~EOS
    csvedit is ad-hoc signed, not notarized. If macOS blocks the first
    launch, either reinstall with:
      brew reinstall --cask --no-quarantine csvedit
    or allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
