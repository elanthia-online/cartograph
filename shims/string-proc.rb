require "digest/md5"

class StringProc
  ALL_STRING_PROCS = {}

  def self.each(&block)
    ALL_STRING_PROCS.each(&block)
  end

  def self._load(ruby_string)
    new(ruby_string)
  end

  attr :string
  def initialize(string)
    @string = string
    ALL_STRING_PROCS[checksum] = @string
  end

  def to_s()
    checksum
  end

  def to_json(*args)
    {stringproc: checksum}.to_json(*args)
  end

  def to_rb()
    @string
  end

  def checksum()
    Digest::MD5.hexdigest @string
  end
end