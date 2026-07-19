# frozen_string_literal: true

# Formula for BlastShield.
class Blastshield < Formula
  desc "Sandbox AI coding agents against destructive cloud CLI commands"
  homepage "https://cdrxyz.github.io/blastshield"
  url "https://github.com/cdrxyz/blastshield/releases/download/v0.1.20/blastshield-0.1.20.tar.gz"
  version "0.1.20"
  sha256 "0ddb2d4b5c35f6721017cde2dff4250970962873946d2c1b50b80e8f03141e6f"
  license "Apache-2.0"

  depends_on "bash"

  def install
    libexec.install "blastshield", "profiles", "helpers"
    bin.write_exec_script libexec/"blastshield"
    bin.write_exec_script libexec/"helpers/blastshield-guard"

    bash_completion.install "completions/blastshield.bash" => "blastshield"
    zsh_completion.install "completions/_blastshield"
  end

  test do
    output = shell_output("#{bin}/blastshield --version 2>/dev/null || #{bin}/blastshield --version")
    assert_match "blastshield v#{version}", output
  end
end
