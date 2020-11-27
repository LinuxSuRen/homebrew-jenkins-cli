# This file was generated by GoReleaser. DO NOT EDIT.
class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://github.com/jenkins-zh/jenkins-cli"
  version "0.0.32"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.32/jcli-darwin-amd64.tar.gz"
    sha256 "aef8af57f87b002620ce46ac550dac2c85c7aa8172a2b5d20e96a61588d50887"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.32/jcli-linux-amd64.tar.gz"
    sha256 "5b481d46ffdfb9ac9177c6b27360afedede1312b29c7cfed5a34605b23bd2a73"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.32/jcli-linux-arm64.tar.gz"
    sha256 "dbec86491b7c00b6b510d9171906355f85b444659eae059abdbc200f6ee5e77a"
  end
  
  depends_on "vim" => :optional
  depends_on "bash-completion" => :optional

  def install
    bin.install name
    
    # Install bash completion
    output = Utils.popen_read("#{bin}/jcli completion")
    (bash_completion/"jcli").write output
    
    # Install zsh completion
    output = Utils.popen_read("#{bin}/jcli completion --type zsh")
    (zsh_completion/"_jcli").write output
    
    (Pathname.pwd/"man").mkpath
    system "#{bin}/jcli", "doc", "--doc-type", "ManPage", "man"
    man1.install Dir["man/*.1"]
    
    prefix.install_metafiles
  end

  test do
    version_output = shell_output("#{bin}/jcli version")
    assert_match version.to_s, version_output
  end
end
