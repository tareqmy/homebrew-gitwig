class Gitwig < Formula
  desc "Rust-based Terminal User Interface (TUI) for Git"
  homepage "https://github.com/tareqmy/gitwig"
  version "2.3.16"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9025c2c49f45ee4e80db4d67c0ba4734d33db97b7d6d16beb67ba070d57ddc7c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "235937bde2f615e49ea1c12e817ad7d0703b19b3fd789642c069e5ffa86383cf"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tareqmy/gitwig/releases/download/v#{version}/gitwig-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4bae479710b86470d231ce60180311abef81294e1102e5e8b01d79a9dbe5399"
    end
  end

  def install
    bin.install "gitwig"
  end

  test do
    assert_match "gitwig", shell_output("#{bin}/gitwig --version")
  end
end
