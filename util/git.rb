require 'open3'

module Git
  def self.exec(cmd)
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      err = stderr.read.chomp
      raise StandardError, err unless err.empty?
      return stdout.read.chomp
    end
  end

  def self.diff_range(range)
    Git.exec("git diff --name-only #{range}").split(" ")
  end
end