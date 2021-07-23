class FoundationDeveloper < Formula
   desc "👒 Install Objective C with mulle-sde and the MulleFoundation"
   homepage "https://github.com/MulleFoundation/foundation-developer"
   url "https://github.com/MulleFoundation/MulleFoundation-developer/archive/0.13.0.tar.gz"
   sha256 ""
   # version "0.13.0"

   depends_on "mulle-kybernetik/software/mulle-objc-developer"
   def install
     system "./installer", "#{prefix}"
   end
end
