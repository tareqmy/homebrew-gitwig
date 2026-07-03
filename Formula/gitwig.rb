class Gitwig < Formula
  desc "Rust-based Terminal User Interface (TUI) for Git"
  homepage "https://github.com/tareqmy/gitwig"
  version "2.3.17"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "13412e73e125115f3af5a546a44210e0bec9d2d65c0c70bf1a7752f9882d7162"
    elsif Hardware::CPU.arm?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9b07efe7ccbb8650bf2c29e991aaa427d57acd7f97b6ea38035e8d2564720759"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7f41a04824e53c979c3ec8423f99b100bc1a54c88a0710ce4466aae674a3e1e4"
    end
  end

  def install
    bin.install "gitwig"
  end

  test do
    assert_match "gitwig", shell_output("#{bin}/gitwig --version")
  end
end
