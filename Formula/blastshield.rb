# frozen_string_literal: true

# Formula for BlastShield.
class Blastshield < Formula
  desc "Sandbox AI coding agents against destructive cloud CLI commands"
  homepage "https://cdrxyz.github.io/blastshield"
  url "https://github.com/cdrxyz/blastshield/releases/download/v0.1.7/blastshield-0.1.7.tar.gz"
  version "0.1.7"
  sha256 "139106ffe2f81544d0a9cc27baa4786791b2924dee956df80801caddc8031b3a"
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
