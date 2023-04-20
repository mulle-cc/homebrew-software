class MulleObjcDeveloper < Formula
desc "🎩 mulle-objc developer kit for mulle-sde"
homepage "https://github.com/mulle-objc/mulle-objc-developer"
url "https://github.com/mulle-objc/mulle-objc-developer/archive/0.25.0.tar.gz"
sha256 "09f7ce8b79270d4b35fbf496fd46ee34f7792b7ffd1a57603cb2b00318070cd9"
# version "0.25.0"

depends_on "mulle-kybernetik/software/mulle-c-developer"
def install
  system "./bin/installer", "#{prefix}"
end
end
# FORMULA mulle-objc-developer.rb
