move 'south' while checkpaths.include?('s')
 move 'west' if checkpaths.include?('w') and !checkpaths.include?('e')
 move 'east' if checkpaths.include?('e') and !checkpaths.include?('w')