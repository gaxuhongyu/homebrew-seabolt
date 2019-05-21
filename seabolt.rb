# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Seabolt < Formula
  desc "Neo4j Bolt Connector for C"
  homepage "https://github.com/neo4j-drivers/seabolt"
  url "https://github.com/neo4j-drivers/seabolt/archive/v1.7.4.zip"
  sha256 "4aa1bbe30a7851cc2475cb76b4aa30a8ff4342e2059ac61321760695e2426112"
  
  depends_on "cmake"
  depends_on "openssl"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./make_release.sh"
    inreplace "build/dist/share/pkgconfig/seabolt17.pc", "${pcfiledir}/../..", "#{prefix}"
    inreplace "build/dist/share/pkgconfig/seabolt17-static.pc", "${pcfiledir}/../..", "#{prefix}"

    prefix.install Dir["build/dist/*"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test seabolt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
