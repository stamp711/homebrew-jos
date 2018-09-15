class I386JosElfBinutils < Formula
  desc "FSF/GNU binutils for cross-compiling to i386-jos"
  homepage "https://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.21.1.tar.bz2"
  sha256 "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--disable-werror",
                          "--disable-nls"
    system "make"
    system "make", "install"

    rm_r share/"info"
    rm_r lib
  end

  test do
    system "#{bin}/i386-jos-elf-objdump -i"
  end

end
