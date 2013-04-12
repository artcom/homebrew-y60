require 'formula'

class Y60 < Formula
  homepage 'http://y60.artcom.de'
  version "1.0.8"

  option 'with-gtk', "Enable building g60 and y60jsgtk component"
  option 'with-cryptopp', "Enable building cryptopp component"
  option 'with-tuio', "Enable building TUIO component"
  option 'with-cairo', "Enable building cairo component"
  option 'use-internal-git', 'Use ART+COM internal repository'
  option 'enable-tests', 'build and execute unit tests'
  option 'disable-buildinfo', 'disable compiled in buildinfo'

  git_url = if build.include? "use-internal-git"
              "git://gitorious.intern.artcom.de/pro/y60src.git"
            else
              'https://github.com/artcom/y60.git'
            end
  url git_url, :using => :git, :tag => '1.0.8'
  head git_url, :using => :git, :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'acmake' => :build
  depends_on 'pkg-config' => :build

  depends_on 'libpng'
  depends_on 'libtiff'
  depends_on 'glew'
  depends_on 'jpeg-turbo'
  depends_on 'openexr'
  depends_on 'sdl'
  depends_on 'freetype'
  depends_on 'ffmpeg'
  depends_on 'giflib'
  depends_on 'asl'
  depends_on 'glib'
  depends_on :x11

  if build.include? 'with-tuio'
    depends_on 'tuio_cpp'
  end
  if build.include? 'with-cryptopp'
    depends_on 'cryptopp'
  end
  if build.include? 'with-cairo'
    depends_on 'cairo'
    depends_on 'pango'
  end
  if build.include? 'with-gtk'
    depends_on 'gtkmm'
    depends_on 'libglademm'
  end

  def install
    if system('which cgc')
      onoe 'NVIDIA Cg Toolkit missing. Get if from http://developer.nvidia.com/cg-toolkit and try again'
    end

    #ENV.x11

    args = std_cmake_args
    args << '-DACMAKE_BUILD_TESTS=OFF' unless build.include? 'enable-tests'
    args << '-DACMAKE_BUILDINFO=OFF' if build.include? 'disable-buildinfo'
    args << '-DACMAKE_BUILDINFO_SCMDATA=OFF' if build.include? 'disable-buildinfo'
    args << '-DY60_WITH_GTK=OFF' unless build.include? 'with-gtk'

    system "cmake", ".", *args
    system "make"
    system "make test" if build.include? 'enable-tests'
    system "make install"
  end

  def test
    system "make test"
  end
end
