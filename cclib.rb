require 'formula'

class Cclib < Formula
  homepage 'https://github.com/artcom/cclib'
  git_url = 'https://github.com/artcom/cclib.git'

  head git_url, :branch => 'master'

  depends_on 'boost' => :build
  depends_on 'glew' => :build
  depends_on 'glfw' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

end
