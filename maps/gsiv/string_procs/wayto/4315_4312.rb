move checkpaths[rand(checkpaths.length)] until checkpaths.include?('down') or checkpaths.include?('up')
 move 'up' if checkpaths.include?('up')