class NextpnrNexus < Formula
  desc "Portable FPGA place-and-route tool (Nexus)"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "eigen" => :build
  depends_on "pkg-config" => :build

  depends_on "boost"
  depends_on "boost-python3"
  depends_on "project-oxide"
  depends_on "python@3.10"
  depends_on "qt@5"

  def install
    args = %W[
      -DARCH=nexus
      -DOXIDE_INSTALL_PREFIX=#{HOMEBREW_PREFIX}
      -DBoost_NO_BOOST_CMAKE=on
      -DBUILD_TESTS=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
