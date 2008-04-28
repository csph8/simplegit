# a super simple example class to use git in ruby
class SimpleGit
  
  def initialize(git_dir = '.')
    @git_dir = File.expand_path(git_dir)
  end
  
  def status
    command("git status")
  end

  def show(treeish = 'master')
    command("git show --raw #{treeish}")
  end

  def log(treeish = 'master')
    command("git log -n 25 #{treeish}")
  end

  def blame(path)
    command("git blame #{path}")
  end

  def cat-file(path)
    command("git cat-file -p #{path}")
  end

  def ls_tree(treeish = 'master')
    command("git ls-tree -r -t #{treeish}")
  end

  def ls_files
    command("git ls-files --stage")
  end

  def file_type(sha)
    command("git cat-file -t #{sha}")
  end

  def file_size(sha)
    command("git cat-file -s #{sha}")
  end

  private
  
    def command(git_cmd)
      Dir.chdir(@git_dir) do
        return `#{git_cmd} 2>&1`.chomp
      end
    end
  
end
