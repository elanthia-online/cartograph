require "json"
require_relative "../shims/string-proc"
require_relative "../util/log"

module HMR
  @rooms = {}
  @string_procs = {}

  def self.load_rooms()    
    Dir[File.join("maps", "gsiv", "rooms", "*.json")].each do |file|
      room = JSON.parse File.read(file)
      @rooms[room["id"]] = room
      %w(wayto timeto).each do |kind|
        room[kind].map do |k, v|
          [k, 
            v.is_a?(Hash) ? load_string_proc(kind, room["id"], k) : v ]
        end
      end
    end
  end

  def self.load_string_proc(kind, from, to)
    from = from.to_i
    to   = to.to_i
    file = File.join("maps", "gsiv", "string_procs", kind.to_s, "#{from}_#{to}.rb")
    @string_procs[kind.to_sym] ||= {}
    @string_procs[kind.to_sym][from] ||= {}
    @string_procs[kind.to_sym][from][to] = StringProc.new(%(eval File.read "#{file}"))
    return @string_procs[kind.to_sym][from][to]
  end

  def self.build(file)
    HMR.load_rooms()

    File.write(
      file,
      Marshal.dump({
        rooms: @rooms,
        checksum: File.read("./checksum"),
        string_procs: @string_procs}))
  end
end