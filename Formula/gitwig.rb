class Gitwig < Formula
  desc "Rust-based Terminal User Interface (TUI) for Git"
  homepage "https://github.com/tareqmy/gitwig"
  version "2.3.15"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0426dbc98c742890c28b8f388dab5b1fb0045817bbc842dd108496448f8e2309"
    elsif Hardware::CPU.arm?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cf69254cc0ab6063d1a687ff33990ed76f4cc659b128aab81bef01d755ec3e1a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "168af404b48c899235cf0999e7b7d3cfe5e68fcbdf4b6a6a6a94f665b34759a6"
    end
  end

  def install
    bin.install "gitwig"
  end

  test do
    assert_match "gitwig", shell_output("#{bin}/gitwig --version")
  end
end
