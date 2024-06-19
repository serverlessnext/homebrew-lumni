class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "9c14f04"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "37a19d7c6a466814c5f5dc2d573a76055bf567833479f57aae735e3e62a497cc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "347396b7ed74f217273cee76834fa3bcb20e4f8f177b765f7e0812b900ca46ec"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "1be09b9216c7d7e7993c126839384a45a131176711ec68f13f5eb4b10b579b0b"
  end

  def install
    bin.install "lumni"
  end
end
