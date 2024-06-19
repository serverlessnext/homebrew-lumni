class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "1453eb5"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "{{ SHA256_MAC_INTEL }}"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "{{ SHA256_MAC_ARM }}"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "8957241286adc80ada8facd8c7a7d4edaf5f8c995b254d8a825a64f156e13ed1"
  end

  def install
    bin.install "lumni"
  end
end
