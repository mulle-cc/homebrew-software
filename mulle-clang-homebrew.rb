class MulleClangHomebrew < Formula
  homepage "https://github.com/mulle-objc/mulle-clang-homebrew"
  desc "Shim for compiling homebrew packages with the mulle-objc compiler"

  depends_on 'mulle-clang-project' => :build

  keg_only "this shim is only used inside a brew formula."

  # ther archive is totally bogus and just used for versioning
  url "https://github.com/mulle-cc/mulle-clang-homebrew/archive/refs/tags/0.0.2.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  def install
    shimdir = ENV[ "HOMEBREW_LIBRARY"] + "/Homebrew/shims/super"
    src     = shimdir + "/cc"
    dst     = "#{prefix}/bin/mulle-clang"

    if ! File.directory?( shimdir)
      raise StandardError, "Unable to find homebrew shimdir " + shimdir
    end

    if ! File.readable?( src)
      raise StandardError, "Unable to find homebrew shim cc in shimdir " + shimdir
    end

    if ! File.directory?( "#{prefix}/bin")
       Dir.mkdir( "#{prefix}/bin", 0755)
    end

    text = File.read( src)
    text = text.gsub( /\/\^clang\//, "/clang/")
    text = text.gsub( /^( *)ENV\[\"HOMEBREW_CC\"\]( *)$/, "\\1\"mulle-clang\"")

    File.open( dst, "w") {|file| file.puts text }
    File.chmod( 0755, dst)

    # also copy xcrun, but fix SUPERBIN bug

    src = shimdir + "/xcrun"
    dst = "#{prefix}/bin/xcrun"

    if ! File.readable?( src)
      raise StandardError, "Unable to find homebrew shim xcrun in shimdir " + shimdir
    end

    text = File.read( src)
    text = text.gsub( /^SUPERBIN=.*/, "SUPERBIN=\"\$\{0\%\/\*}\"")
    File.open( dst, "w") {|file| file.puts text }
    File.chmod( 0755, dst)
  end

  test do
     true
  end
end
