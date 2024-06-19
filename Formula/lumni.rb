class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "b0367ea"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "{{ SHA256_MAC_INTEL }}"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "{{ SHA256_MAC_ARM }}"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "2c2c36759c8014cc190eb289c97da5e04e8f5ff67d29f73d1ab532d75960796f"
  end

  def install
    bin.install "lumni"
  end
end
