class Kf5Kcodecs < Formula
  desc "Provide a collection of methods to manipulate strings using various encodings"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.41/kcodecs-5.41.0.tar.xz"
  sha256 "0977b4eed346230837c3ec59e08e43977ae8657e18cc8e279f030199eeaa2679"
  revision 1

  head "git://anongit.kde.org/kcodecs.git"

  depends_on "cmake" => :build
  depends_on "gperf" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
