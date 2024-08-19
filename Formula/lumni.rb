class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"
  release_tag = "2kzgm09z"
  version release_tag
  base_url = "https://github.com/serverlessnext/lumni/releases/download/#{release_tag}"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "8b28cf921b509ddc01517de1142cd8ea92eb306be20493f3842f427497c93a7c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "6f6291713b174e1389e0fd02c7666a7fd9896e3806d3956e7474ea9ee271ad51"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "c2df4fdff040871622060317eb55ff43bbf671181296d5e9e0d8d6063b0feaed"
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
