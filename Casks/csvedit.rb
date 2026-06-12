cask "csvedit" do
  version "1.0.1"
  sha256 "e512f692b3957783e2c83ebd4bf67f6fd1cdfb5abb73ac0fcd42f064015ba507"

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
