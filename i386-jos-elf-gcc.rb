class I386JosElfGcc < Formula
  desc "GNU compiler collection for cross-compiling to i386-jos"
  homepage "https://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "http://ftpmirror.gnu.org/gcc/gcc-4.6.4/gcc-core-4.6.4.tar.bz2"
  sha256 "48b566f1288f099dff8fba868499a320f83586245ec69b8c82a9042566a5bf62"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "i386-jos-elf-binutils"

  def install
    mkdir "build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i386-jos-elf",
                             "--disable-werror",
                             "--disable-libssp",
                             "--disable-libmudflap",
                             "--with-newlib",
                             "--without-headers",
                             "--enable-languages=c",
                             "MAKEINFO=missing",
                             "--with-as=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-as",
                             "--with-ld=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-ld",
                             "--disable-nls"
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end

    info.rmtree
  end

  test do
    system "#{bin}/i386-jos-elf-gcc -v"
  end

end
