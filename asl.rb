require 'formula'

class Asl < Formula
  homepage 'https://github.com/artcom/asl'
  version '1.0.8'

  option 'use-internal-git', 'Use ART+COM internal repository'
  option 'enable-tests', 'build and execute unit tests'
  option 'disable-buildinfo', 'disable compiled in buildinfo'

  git_url = if build.include? "use-internal-git"
              "git://gitorious.intern.artcom.de/pro/asl.git"
            else
              'https://github.com/artcom/asl.git'
            end


  url git_url, :using => :git, :tag => '1.0.8'
  head git_url, :using => :git, :branch => 'master'

  depends_on 'acmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'cmake' => :build
  depends_on 'coreutils'
  depends_on 'curl'
  depends_on 'glib'
  depends_on 'boost'

  def install
    args = std_cmake_args
    args << '-DACMAKE_BUILD_TESTS=OFF' unless build.include? 'enable-tests'
    args << '-DACMAKE_BUILDINFO=OFF' if build.include? 'disable-buildinfo'
    args << '-DACMAKE_BUILDINFO_SCMDATA=OFF' if build.include? 'disable-buildinfo'

    system "cmake", ".", *args
    system "make"
    system "make test" if build.include? 'enable-tests'
    system "make install"
  end

  def test
    system "make test"
  end
end
