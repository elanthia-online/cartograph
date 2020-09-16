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
      if edge.is_a?(Hash) && edge["stringproc"]
        rb_script = File.read(
          MapDB.env_dir("string_procs", kind, "%s_%s.rb" % [room["id"], other_id]))
        room[kind][other_id] = (
          "%s %s" % [MapDB::STRING_PROC_PREAMBLE, rb_script])
      end
    }
  end

  def self.export_bundle(compressed: true)
  
    runtime = Benchmark.realtime { 
      cartograph_db = load_files(Cartograph.rooms) {|f| JSON.parse(f) }
      cartograph_db.each { |room|
        load_procs(room, "wayto")
        load_procs(room, "timeto")
      }

      File.write(cartograph_file, 
        cartograph_db.to_json)
    }

    puts "mapdb bundled in #{runtime}s"
  end
end