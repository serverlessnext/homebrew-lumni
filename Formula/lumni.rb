class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "c7bb40c"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "8ac25080a92c1f24306291d4e12726fd1adeacd2af01f067ee3cb01a7feb2476"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "a460309c69875a2649bf4e25b26ea484d08c78674c91569f2d57223eba65e5f2"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "d7561cfcca37e29c1829815fe1b028f6cf1bb15496f198ead87966ba0de42a17"
  end

  def install
    bin.install "lumni"
  end
end
