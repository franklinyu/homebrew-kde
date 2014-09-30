require "formula"

class Kf5Kdnssd < Formula
  url "http://download.kde.org/stable/frameworks/5.2.0/kdnssd-5.2.0.tar.xz"
  sha1 "1b1a4e964e7ea365001c7b4489b9ed41fb7dc8a2"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/attica.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end