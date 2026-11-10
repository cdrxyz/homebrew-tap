cask "q-for-email" do
  version "0.1.0"
  sha256 "7e08bf76b102d4014bf8fcbb5b224c1a6cb317a9ba9aa034dc71ce567d2bb9d4"

  url "https://github.com/cdrxyz/q-for-email/releases/download/v#{version}/Q-for-Email-#{version}-arm64.zip"
  name "Q for Email"
  desc "File non-essential Apple Mail into Q mailboxes with your own AI endpoint"
  homepage "https://github.com/cdrxyz/q-for-email"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Q for Email.app"

  zap trash: [
    "~/Library/Application Support/Q for Email",
    "~/Library/Preferences/xyz.cdr.q-for-email.plist",
  ]

  caveats <<~EOS
    This build is not notarized. If macOS blocks the first open, right-click
    Q for Email in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "/Applications/Q for Email.app"
    Then allow it to control Mail in System Settings → Privacy & Security → Automation.
  EOS
end
