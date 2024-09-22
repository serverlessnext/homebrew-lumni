class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"
  release_tag = "2kzh83ci"
  version release_tag
  base_url = "https://github.com/serverlessnext/lumni/releases/download/#{release_tag}"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "b455f13394b733112b22fb116505074e6ec95c1ac94d83f83a782525b1487e9d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "bdc96e38b50d6fe6a1fac2a0d32ef38e4429b3dd6d1699c0c49d8b27f267864d"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "e848b7f2248030006f6f74412a8849783fe83a44672de89a286bf10d90f719fe"
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
