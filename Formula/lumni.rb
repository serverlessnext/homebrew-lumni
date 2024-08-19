class Lumni < Formula
  desc "Lumni CLI"
  homepage "https://github.com/serverlessnext/lumni"
  release_tag = "2kzgm09k"
  version release_tag
  base_url = "https://github.com/serverlessnext/lumni/releases/download/#{release_tag}"

  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "9a5f3993052d92a21f393212caeb72b041df442cb8ea679a6923e6165372b079"
  elsif OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/lumni-aarch64-apple-darwin-#{release_tag}.tar.gz"
    sha256 "906d5fd0c0410ab8964aea1bb4c4741a3a2cdcc14fabb143522f2237258061a3"
  elsif OS.linux && Hardware::CPU.intel?
    url "#{base_url}/lumni-x86_64-unknown-linux-gnu-#{release_tag}.tar.gz"
    sha256 "d0ed31b0b9729be87355a36729236ae1355e8a1fe720f36428f9863c5109dd00"
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
