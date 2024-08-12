class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"
  release_tag = "2kzgki7p"
  version release_tag
  base_url = "https://github.com/serverlessnext/lumni/releases/download/#{release_tag}"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "181576a940e8236213afb4a7f6a788f82ba61b71c6c9de90738137bb236a12dc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "9b84dbbe0dae031f5c82b3dd7c024394d711734e37d9b0db0357d9a6a0c6f367"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "4afd4efa1c820389dfb5c1b58f5568771278ce91b487f73bcd78ffcfba6ffb8d"
  end

  def install
    bin.install "lumni"
  end

  test do
    # This regex matches "lumni <version>" followed optionally by "-<sha>" and any text after
    version_regex = /^lumni \s*#{Regexp.escape(version)}(-[0-9a-f]+)?(\s+.*)?$/i
    output = shell_output("#{bin}/lumni --version")
    assert_match version_regex, output
  end
end
