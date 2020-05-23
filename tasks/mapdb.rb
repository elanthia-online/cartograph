#!/usr/bin/env ruby
require "json"
require "cgi"
require "fileutils"
require "digest/md5"
require "benchmark"
require "pathname"
require_relative "../util/opts"
require_relative "../util/color"
require_relative "../util/log"
require_relative "../shims/map"
require_relative "../shims/string-proc"

module MapDB
  GAME = "gsiv"

  def self.mapdb_file()
    File.join Dir.pwd, "tmp", "map.db"
  end

  def self.load_map()
    @_map ||= Marshal.load(File.read(mapdb_file)).compact
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
      room_file = env_dir("rooms", "#{room.id}.json")
      File.write(room_file, json)
    end
  end

  def self.import_string_procs()
    load_map.each do |r| 
      string_proc_to_git(r, :wayto)  if r.has_wayto_string_proc?
      string_proc_to_git(r, :timeto) if r.has_timeto_string_proc?
    end
  end

  def self.string_proc_to_git(room, method)
    room.send(method)
      .select do |_, value| value.is_a?(StringProc) end
      .each do |wayto_id, string_proc|
        File.write(
          env_dir("string_procs", method.to_s, "#{room.id}_#{wayto_id}.rb"), 
          string_proc.to_rb)
      end
  end

  def self.import_mapdb()
    runtime = Benchmark.realtime { 
      cleanup_dirs
      setup_dirs
      import_rooms
      import_string_procs
    }

    puts "mapdb synced in #{runtime}s"
  end
end