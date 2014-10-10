require 'formula'

class Freeglut < Formula
  homepage 'http://freeglut.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/freeglut/freeglut/2.8.1/freeglut-2.8.1.tar.gz'
  sha1 '7330b622481e2226c0c9f6d2e72febe96b03f9c4'

  # Examples won't build on Snow Leopard as one of them requires
  # a header the system provided X11 doesn't have.
  option 'with-examples', "Build the examples."
  option :universal

  depends_on :x11

  if MacOS.version >= :lion
      patch do
          url "https://gist.githubusercontent.com/escherba/714f0869b01c2cd81c54/raw/7fe1548a1eda22e6feb9f9638d0fa5723ad3374b/freeglut_mac"
          sha1 "d5344c076d1e8e3bc3cae52a908e24d525f55231"
      end
      #patch do
      #    url "https://gist.githubusercontent.com/escherba/464709bf71e0630d9488/raw/24e7598f1744238d98f8da382ec4c9394f581487/freeglut_mavericks"
      #    sha1 "52f5c8fca2f5fd565363ef87899a1b8979fe5ccf"
      #end
  end

  #patch :DATA if MacOS.version >= :lion

  def install
    ENV.universal_binary if build.universal?
    #ENV.append 'LDFLAGS', "-L/opt/X11/lib"
    #ENV.append 'CPPFLAGS', "-I/opt/X11/include"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    if build.without?('examples') || MacOS.version < :lion
      inreplace 'Makefile' do |s|
        s.change_make_var! 'SUBDIRS', 'src include doc'
      end
    end

    system "make all"
    system "make install"
  end
end
