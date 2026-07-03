class Gitwig < Formula
  desc "Rust-based Terminal User Interface (TUI) for Git"
  homepage "https://github.com/tareqmy/gitwig"
  version "2.3.14"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7edeff384287f600459411e5129a5e47615c7095036ef604e64ad13cb5c4efa6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "919eac0dedde5e91176be4276d8b1d68b7d3d28725f21978e9332fad1cf0a6d9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a1032963f8d84c2dd1053056e854f0b3b31affe553ab5b8005ed341623357104"
    end
  end

  def install
    bin.install "gitwig"
  end

  test do
    assert_match "gitwig", shell_output("#{bin}/gitwig --version")
  end
end
