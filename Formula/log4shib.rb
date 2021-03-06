class Log4shib < Formula
  desc "Forked version of log4cpp for the Shibboleth project"
  homepage "https://wiki.shibboleth.net/confluence/display/OpenSAML/log4shib"
  url "https://shibboleth.net/downloads/log4shib/1.0.9/log4shib-1.0.9.tar.gz"
  sha256 "b34cc90f50962cc245a238b472f72852732d32a9caf9a10e0244d0e70a311d6d"

  bottle do
    cellar :any
    sha256 "d1296027b5fa1dea806bcb628389585b01cc811ab83ef569f046cb97e40febc7" => :mojave
    sha256 "e8579b422326aafe0c42e8658ea8bdc83a7659724dcaf052e8c84a88cc6feb9f" => :high_sierra
    sha256 "cc682d3389900e2d87ab5236add6141228f6e9a77c0d686450d641257772eb35" => :sierra
    sha256 "469e66a59e1f3ccf2607a77a4198b6f5fb80d100b00ec7228cd165ca13624323" => :el_capitan
    sha256 "4bc1071029e6c9cb46d8ab05079ae9d8dc148df73009db99c4e94dfaab74fe4c" => :yosemite
    sha256 "0d3d2c95cac3b915a3278ea14550eaedd8e12aea205d7833a7266f4121e56a45" => :mavericks
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make", "install"
  end

  test do
    assert_equal "-L#{HOMEBREW_PREFIX}/Cellar/log4shib/1.0.9/lib -llog4shib",
                 shell_output("#{bin}/log4shib-config --libs").chomp
  end
end
