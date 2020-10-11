require "json"
require "eol-cartograph/version"

module Cartograph
  class Error < StandardError; end

  def self.map_file()
    File.join(__dir__, "..", "dist", "gsiv.json")
  end

  def self.load()
    JSON.parse File.read map_file
  end
end
