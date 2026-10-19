class ClaudeTodo < Formula
  desc "/todo skill for Claude Code: todos as Markdown folders in a git repo"
  homepage "https://github.com/zinoodev85/claude-todo"
  url "https://github.com/zinoodev85/claude-todo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8b5ea5c13b99590e413e7b0c44353df2d5eff30ca7fec008f3271ce07c53a548"
  license "MIT"

  depends_on "python@3"

  def install
    pkgshare.install "skill"
    inreplace "bin/claude-todo", "@SKILL_DIR@", "#{opt_pkgshare}/skill"
    bin.install "bin/claude-todo"
  end

  def caveats
    <<~EOS
      Link the skill into Claude Code and create the todo repo (~/todos):
        claude-todo install
        claude-todo init
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/claude-todo version").strip
    assert_path_exists pkgshare/"skill/SKILL.md"
  end
end
