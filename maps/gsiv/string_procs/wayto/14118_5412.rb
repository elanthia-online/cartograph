move 'north' while checkpaths.include?('n')
 move 'east' if checkpaths.include?('e') and !checkpaths.include?('w')
 move 'west' if checkpaths.include?('w') and !checkpaths.include?('e')