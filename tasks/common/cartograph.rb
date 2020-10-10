require 'fileutils'
require 'digest'
require_relative "./mapdb"

module Cartograph
  def self.cartograph_file()
    File.join Dir.pwd, "tmp", "cartograph.json"
  end

  def self.load_files(files)
    files.map {|file| yield File.read(file)}
  end

  def self.rooms()
    Dir[
      File.join(
        MapDB.env_dir("rooms"), "**/*.json")]
  end

  def self.load_procs(room, kind)
    room[kind].each {|other_id, edge|
      if edge.is_a?(Hash) && (edge["file"] || edge["stringproc"])
        rb_script = File.read MapDB.env_dir(edge["file"])
        room[kind][other_id] = (
          "%s %s" % [MapDB::STRING_PROC_PREAMBLE, rb_script])
      end
    }
  end

  def self.export_bundle(pretty: Opts.pretty)
    runtime = Benchmark.realtime { 
      FileUtils.mkdir_p(File.join(Dir.pwd, "tmp"))
      cartograph_db = load_files(Cartograph.rooms) {|f| JSON.parse(f) }
      cartograph_db.each { |room|
        load_procs(room, "wayto")
        load_procs(room, "timeto")
      }

      File.write(cartograph_file, 
        pretty ? JSON.pretty_generate(cartograph_db) : cartograph_db.to_json)
    }

    puts "cartographdb bundled in #{runtime}s to #{cartograph_file}"

    Digest::MD5.hexdigest(File.read(cartograph_file))
  end
end