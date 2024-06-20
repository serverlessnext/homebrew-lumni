class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"

  # Define the base URL and commit hash as variables
  base_url = "https://github.com/serverlessnext/lumni/releases/download"
  release_tag = "628a063"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "19641cba27d6039fd23f9b887a4cf3833b8b1b0bee3a1c42f116790eb576721f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/#{release_tag}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "ac697fc5c3e4b1983185ea7ebb42236023e23e119428828c6507e5e895749103"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/#{release_tag}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "8d40564a4bd5a29b654297cbdf522d7a99d31f153d346b85e6398fb42e19f799"
  end

  def install
    bin.install "lumni"
  end
end
