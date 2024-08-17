class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"
  release_tag = "2kzgljx1"
  version release_tag
  base_url = "https://github.com/serverlessnext/lumni/releases/download/#{release_tag}"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "7e2752703e18840adefcda176beb30be15c6418f358a9e7f4bfaa5359b25d6c7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "7022b9e113558e64f3d1a483de9d33a6d3c36ec4c7ff3017e04eeaad4fc42e28"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "18c3bb732e3e49463c706f5535291838e57c54f18d39ba6c08aac79f19b824e4"
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
