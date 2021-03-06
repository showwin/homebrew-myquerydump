require 'formula'

HOMEBREW_MYQUERYDUMP_VERSION = '1.0.1'
class Myquerydump < Formula
  homepage 'https://github.com/showwin/myquerydump'
  url 'https://github.com/showwin/myquerydump.git', tag: "v#{HOMEBREW_MYQUERYDUMP_VERSION}"
  version HOMEBREW_MYQUERYDUMP_VERSION
  head 'https://github.com/showwin/myquerydump.git', branch: 'master'

  depends_on 'go' => :build
  depends_on 'mercurial' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/go-sql-driver/mysql'
    system 'go', 'get', 'github.com/howeyc/gopass'
    system 'go', 'build', '-o', 'myquerydump'
    bin.install 'myquerydump'
  end
end
