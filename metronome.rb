# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Metronome < Formula
  desc "A command-line metronome which sounds out the beats 🥁"
  homepage "https://github.com/MadeleineSmith/metronome"
  url "https://github.com/MadeleineSmith/metronome/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "574401f4b8dae4c4d8042c038ff93a32b826b32e26e446fa7e7083ff39ec6489"
  license "MIT"

  depends_on "go"


  def install
      ENV["GOPATH"] = buildpath
      ENV["GO111MODULE"] = "on"
      ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
      (buildpath/"src/github.com/MadeleineSmith/metronome").install buildpath.children
      cd "src/github.com/MadeleineSmith/metronome" do
        system "go", "build", "-o", bin/"metronome", "."
      end
    end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test metronome`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
