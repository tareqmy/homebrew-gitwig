class Gitwig < Formula
  desc "Rust-based Terminal User Interface (TUI) for Git"
  homepage "https://github.com/tareqmy/gitwig"
  version "2.3.19"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2f831244ec8b12dcfe6d56d1bcf56119ebac3630b59db7d6cfa9112d3c434bc3"
    elsif Hardware::CPU.arm?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "936d33695cb22ced2dd0cecebfb1f33b722304515dc4d6c5cbe32fb2b5a092b9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "99bd6d256194566c4b519483dbb5c2c77733226f47394c728de65d9cd81eb750"
    end
  end

  def install
    bin.install "gitwig"
    bin.install_symlink "gitwig" => "gtg"
  end

  test do
    assert_match "gitwig", shell_output("#{bin}/gitwig --version")
  end
end
