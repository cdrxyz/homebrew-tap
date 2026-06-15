# frozen_string_literal: true

# Formula for BlastShield.
class Blastshield < Formula
  desc "Sandbox AI coding agents against destructive cloud CLI commands"
  homepage "https://cdrxyz.github.io/blastshield"
  url "https://github.com/cdrxyz/blastshield/releases/download/v0.1.10/blastshield-0.1.10.tar.gz"
  version "0.1.10"
  sha256 "74073eecb45a2687ab8a63925d1ec7245c131da0812a5270353973edcf068a68"
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
