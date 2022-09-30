class Icestorm < Formula
  desc "Tools for documenting and working with iCE40 FPGA files"
  homepage "https://github.com/YosysHQ/icestorm"
  head "https://github.com/YosysHQ/icestorm.git"

  depends_on "pkg-config" => :build
  depends_on "gnu-sed" => :build
  depends_on "libftdi"
  depends_on "python@3.10"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end
