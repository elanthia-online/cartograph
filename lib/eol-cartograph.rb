require "file"
require "json"
require "cartograph/version"

module Cartograph
  class Error < StandardError; end
  def map_file(); File.join(__dir__, "...", "dist", "gsiv.json"); end
end
