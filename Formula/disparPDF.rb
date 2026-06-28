class Disparpdf < Formula
  desc "PDF comparison tool — compares text or visual appearance of two PDF files"
  homepage "https://github.com/yuw/disparPDF"

  url "https://github.com/yuw/disparPDF/archive/refs/tags/v1.0.tar.gz"
  sha256 "a77208a4a93fca0b0c72d47a3b7bcd3bf002fd3fa96d92d0df5624e97156fa88"

  license any_of: ["GPL-2.0-or-later"]

  depends_on "cmake"   => :build
  depends_on "pkgconf" => :build
  depends_on "qt@6"
  depends_on "yuw/disparPDF/poppler-qt6"

  def install
    poppler_qt6_prefix = Formula["yuw/disparPDF/poppler-qt6"].opt_prefix
    qt6_prefix         = Formula["qt@6"].opt_prefix

    system "cmake", "-S", ".", "-B", "build",
      *std_cmake_args,
      "-DCMAKE_PREFIX_PATH=#{qt6_prefix};#{poppler_qt6_prefix}",
      "-DCMAKE_BUILD_TYPE=Release"

    system "cmake", "--build", "build", "-j#{ENV.make_jobs}"

    # GUI アプリ
    prefix.install "build/disparPDF.app"

    # CLI バイナリ
    bin.install "build/disparPDFc"

    # GUI を bin からも呼び出せるようにラッパースクリプトを作成
    (bin/"disparPDF").write <<~SHELL
      #!/bin/sh
      open "#{prefix}/disparPDF.app" --args "$@"
    SHELL
    chmod 0755, bin/"disparPDF"
  end

  def post_install
    # install_name_tool による変更後に再署名（macOS 26以降で必須）
    system "codesign", "--force", "--sign", "-",
           "#{prefix}/disparPDF.app/Contents/MacOS/disparPDF"
  end

  test do
    assert_predicate prefix/"disparPDF.app", :exist?
    assert_predicate bin/"disparPDFc", :exist?
  end
end
