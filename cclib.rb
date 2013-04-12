require 'formula'

class Cclib < Formula
  homepage 'https://github.com/artcom/cclib'
  git_url = 'https://github.com/artcom/cclib.git'

  head git_url, :using => :git, :branch => 'master'

  depends_on 'boost' => :build
  depends_on 'glew' => :build
  depends_on 'glfw' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test watchdog`.
    system "false"
  end
end