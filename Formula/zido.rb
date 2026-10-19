class Zido < Formula
  desc "Claude Code skills: /todo in git and /kickoff session prompts"
  homepage "https://github.com/zinoodev85/zido"
  url "https://github.com/zinoodev85/zido/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a543a0cc01a75f9017b3709fef696619757874e07b26476d1c3f93c9bffecb3c"
  license "MIT"

  depends_on "python@3"

  def install
    pkgshare.install "skills"
    inreplace "bin/zido", "@SKILLS_DIR@", "#{opt_pkgshare}/skills"
    bin.install "bin/zido"
  end

  def caveats
    <<~EOS
      Link the skills into Claude Code and create the todo repo (~/todos):
        zido install
        zido init
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/zido version").strip
    assert_path_exists pkgshare/"skills/todo/SKILL.md"
  end
end
