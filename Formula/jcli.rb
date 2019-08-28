class Jcli < Formula
  desc "Jenkins CLI which support you"
  homepage "https://jenkins-zh.cn"
  version "0.0.19"
  
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v#{version}/jcli-darwin-amd64.tar.gz"
  # depends_on "cmake" => :build

  def install
    bin.install name

    prefix.install_metafiles
  end
end
