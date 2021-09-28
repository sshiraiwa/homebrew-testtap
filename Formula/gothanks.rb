class Gothanks < Formula
  desc "Test"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/sshiraiwa/homebrew-testtap/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "71fb46dedeb269e6875b2f5bce9f24402107cf2492b5a405217ea3c83d59a7e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dd6e6e958a6efee9238625bd56bc954d65dc6b2ca4aee63dfd7fb295dfd8afe5"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
