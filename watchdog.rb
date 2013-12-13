require 'formula'

class Watchdog < Formula
  homepage 'https://github.com/artcom/watchdog'

  git_url = if build.include? "use-internal-git"
              "git://gitorious.intern.artcom.de/pro/watchdog.git"
            else
              'https://github.com/artcom/watchdog.git'
            end

  url git_url, :tag => '1.0.9'
  head git_url, :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'acmake' => :build
  depends_on 'asl' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make test" if build.include? 'enable-tests'
    system "make install"
  end

  def test
    system "make test"
  end
end
