require 'formula'

class Acmake < Formula
  homepage 'http://github.com/artcom/acmake'
  version '1.0.8'
  git_url = if build.include? "use-internal-git"
              "git://gitorious.intern.artcom.de/pro/acmake.git"
            else
              'https://github.com/artcom/acmake.git'
            end


  url git_url, :using => :git, :tag => '1.0.8'
  head git_url, :using => :git, :branch => 'master'


  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end