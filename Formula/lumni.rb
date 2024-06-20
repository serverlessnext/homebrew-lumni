class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "256d744"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "c1566f27be3a37a4317ced396e7d4a51355caa8d38ec45379e92d22e4e992aef"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "b56f930a70a0ae5b75c6d2b8b0bc0cf8bffffd523a93c20c72c39378f9b9b496"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "6ba3134ef66ad400ff622e6b6dd5d1a968ea55eb43622b6fbf419a8cb2a4e69e"
  end

  def install
    bin.install "lumni"
  end
end
