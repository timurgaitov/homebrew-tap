cask "csvedit" do
  version "1.0.0"
  sha256 "38192c264dd4761ad092e0f71e3d1aabf20ac37b31440a56d63cd140d0ac5f8d"

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
