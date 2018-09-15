class I386JosElfQemu < Formula

  desc "x86 Emulator"
  homepage "https://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "https://github.com/mit-pdos/6.828-qemu.git", :using => :git
  conflicts_with "qemu"
  
  depends_on "pkg-config" => :build
  depends_on "gnutls"
  depends_on "glib"
  depends_on "pixman"
  
  def install
  
    system "./configure", "--disable-kvm",
                          "--disable-werror",
                          "--disable-sdl",
                          "--prefix=#{prefix}",
                          "--target-list=i386-softmmu,x86_64-softmmu"

    system "make"
    system "make install"
  end
  
  test do
    system "#{bin}/qemu-system-i386 --version"
  end
  
end