require_relative "../../util/git"

module Travis
  def self.git_changes()
    Git.diff_range ENV.fetch("TRAVIS_COMMIT_RANGE")
  end
end