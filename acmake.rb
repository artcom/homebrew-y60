require 'formula'

class Acmake < Formula
  homepage 'https://github.com/artcom/acmake'

  git_url = if build.include? "use-internal-git"
              "git://gitorious.intern.artcom.de/pro/acmake.git"
            else
              'https://github.com/artcom/acmake.git'
            end

  url git_url, :tag => '1.0.9'
  head git_url, :branch => 'master'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
