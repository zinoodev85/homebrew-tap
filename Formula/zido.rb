class Zido < Formula
  desc "/todo skill for Claude Code: todos as Markdown folders in a git repo"
  homepage "https://github.com/zinoodev85/zido"
  url "https://github.com/zinoodev85/zido/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a9e7045e5b924dd88d2489651668cb01d6505cdc285ce9d4a11598f4b41efb34"
  license "MIT"

  depends_on "python@3"

  def install
    pkgshare.install "skill"
    inreplace "bin/zido", "@SKILL_DIR@", "#{opt_pkgshare}/skill"
    bin.install "bin/zido"
  end

  def caveats
    <<~EOS
      Link the skill into Claude Code and create the todo repo (~/todos):
        zido install
        zido init
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/zido version").strip
    assert_path_exists pkgshare/"skill/SKILL.md"
  end
end
