class Sby < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "Front-end for Yosys-based formal verification flows"
  homepage "https://github.com/YosysHQ/sby"
  head "https://github.com/YosysHQ/sby.git"

  depends_on "python@3.10"
  depends_on "yosys"

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  def install
    venv = virtualenv_create(libexec, "python3.10")
    venv.pip_install resources

    system "make", "install", "PREFIX=#{libexec}"

    rewrite_shebang python_shebang_rewrite_info("#{libexec}/bin/python"), "#{libexec}/bin/sby"
    inreplace "#{libexec}/bin/sby", "__file__", "os.path.realpath(__file__)"

    bin.install_symlink "#{libexec}/bin/sby"
  end
end
