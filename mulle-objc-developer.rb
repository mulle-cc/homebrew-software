class MulleObjcDeveloper < Formula
desc "🎩 mulle-objc developer kit for mulle-sde"
homepage "https://github.com/mulle-objc/mulle-objc-developer"
url "https://github.com/mulle-objc/mulle-objc-developer/archive/0.23.0.tar.gz"
sha256 "9ff1458177e28578d522347ae426660b48ea113f969be136ad3f4772d03bf92a"
# version "0.23.0"

depends_on "mulle-kybernetik/software/mulle-c-developer"
def install
  system "./bin/installer", "#{prefix}"
end
end
# FORMULA mulle-objc-developer.rb
