class Sby < Formula
  desc "Front-end for Yosys-based formal verification flows"
  homepage "https://github.com/YosysHQ/sby"
  head "https://github.com/YosysHQ/sby.git"

  depends_on "python@3.10"
  depends_on "yosys"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end
