require 'formula'

class Zbar < Formula
  homepage 'http://zbar.sourceforge.net'
  url 'https://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2'
  sha1 '273b47c26788faba4325baecc34063e27a012963'

  depends_on :x11 => :optional
  depends_on 'pkg-config' => :build
  depends_on 'jpeg'
  depends_on 'imagemagick'
  depends_on 'ufraw'

  def patches
    [
        'https://gist.githubusercontent.com/escherba/9399883/raw/2842c46f86131105c6e8c7ae542c7a37faa2044e/zbar_imagescanner',
        'https://gist.githubusercontent.com/escherba/9400299/raw/318641e89c7051bd7874f75c0c0f5e6eb3d4c798/zbar_jpeg'
    ]
  end

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-python=yes
      --without-qt
      --disable-video
      --without-gtk
    ]

    if build.with? 'x11'
      args << '--with-x'
    else
      args << '--without-x'
    end

    system "./configure", *args
    system "make install"
  end
end
