#!/usr/bin/env ruby
require "json"
require "fileutils"
require "digest/md5"
require "benchmark"
require "pathname"
require "shellwords"
require_relative "../../util/opts"
require_relative "../../util/color"
require_relative "../../util/log"

module MapDB
  GAME = "gsiv"
  STRING_PROC_PREAMBLE = %[;e]
  SYNTAX_OK = "Syntax OK\n"

  StringProc = -> k, v {v.is_a?(String) && v.start_with?(STRING_PROC_PREAMBLE)}

  def self.mapdb_file()
    File.join Dir.pwd, "tmp", "mapdb.json"
  end

  def self.load_map()
    @_map ||= JSON.parse(File.read(mapdb_file))
    @_map.take(Opts.to_h.fetch(:n, 100_000).to_i)
  end

  def self.env_dir(*args)
    File.join Dir.pwd, "maps/#{GAME}", *args
  end

  def self.cleanup_dirs()
    puts "pruning #{env_dir("string_procs")}"
    FileUtils.rm_rf env_dir("string_procs")
    puts "pruning #{env_dir("rooms")}"
    FileUtils.rm_rf env_dir("rooms")
  end

  def self.setup_dirs()
    FileUtils.mkdir_p env_dir("string_procs/wayto")
    FileUtils.mkdir_p env_dir("string_procs/timeto")
    FileUtils.mkdir_p env_dir("rooms")
  end

  def self.import_rooms()
    load_map.each do |room|
      json = JSON.pretty_generate(room)
      room_file = env_dir("rooms", "%s.json" % room["id"])
      File.write(room_file, json)
    end
  end

  def self.import_string_procs()
    load_map.each do |r| 
      string_proc_to_ruby(r, "wayto")  if r["wayto"].any?(&StringProc)
      string_proc_to_ruby(r, "timeto") if r["timeto"].any?(&StringProc)
    end
  end

  def self.string_proc_to_ruby(room, field)
    room[field].select(&StringProc).each do |edge_id, string_proc|
      file = File.join "string_procs", field, "#{room["id"]}_#{edge_id}.rb"
      room[field][edge_id] = {file: file}
      File.write(
        env_dir(file), 
        fmt_string_proc(
          string_proc.slice(STRING_PROC_PREAMBLE.size..-1),
          file: file)
      )
    end
  end

  def self.transform_syntax(string_proc, file:)
    proposed_syntax = string_proc.gsub(";", "\n").strip
    begin
      RubyVM::InstructionSequence.compile(proposed_syntax, file)
      proposed_syntax
    rescue Exception => e
      Log.out(e.message, label: :invalid_syntax)
      string_proc
    end
  end

  def self.fmt_string_proc(sproc, file:)
    transform_syntax(sproc, file: file)
  end

  def self.import_mapdb()
    runtime = Benchmark.realtime { 
      cleanup_dirs
      setup_dirs
      # import stringprocs to filesystem first 
      # so they can modify the room object
      import_string_procs
      import_rooms
    }

    puts "mapdb synced in #{runtime}s"
  end
end