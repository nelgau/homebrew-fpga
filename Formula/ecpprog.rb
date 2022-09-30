class Ecpprog < Formula
  desc "Basic driver for FTDI-based JTAG probes, to program Lattice ECP5/Nexus FPGAs"
  homepage "https://github.com/gregdavill/ecpprog"
  head "https://github.com/gregdavill/ecpprog.git", branch: "main"

  depends_on "libftdi"

  def install
    cd "ecpprog" do
      system "make", "install", "PREFIX=#{prefix}"
    end
  end
end
