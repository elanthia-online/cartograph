
module Dry # runnable
  def self.x(cmd, dry_run = nil)
    if Opts["dry-run"]
      Log.out(cmd.slice(0...100) + (cmd.size > 100 ? "...[truncated]" : ""), label: "dry-run")
      return dry_run
    end
    %x[#{cmd}]
  end

  def self.log(t)
    Log.out(t, label: Opts["dry-run"] ? "dry-run" : "sync")
  end
end