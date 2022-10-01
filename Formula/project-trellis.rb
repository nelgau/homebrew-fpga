class ProjectTrellis < Formula
  desc "Tools for documenting and working with ECP5 FPGA files"
  homepage "https://github.com/YosysHQ/prjtrellis"
  head "https://github.com/YosysHQ/prjtrellis.git"

  depends_on "cmake" => :build
  depends_on "boost-python3" => :build
  depends_on "python@3.10"
  depends_on "libftdi" => :recommended
  depends_on "open-ocd" => :recommended

  def install
    cd "libtrellis" do
      # Modify libtrellis to not depend on local tags, as we're not rapidly
      # rebuilding as the CMake script assumes.
      inreplace "CMakeLists.txt", "git describe", "git describe --always"

      args = %w[
        -DBoost_NO_BOOST_CMAKE=on
      ]

      system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
      system "cmake", "--build", "build"
      system "cmake", "--install", "build"
    end
  end
end
