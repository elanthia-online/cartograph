module Travis
  def self.git_changes()
    %x{git diff --name-only #{ENV.fetch("TRAVIS_COMMIT_RANGE")}}.split(" ")
  end
end