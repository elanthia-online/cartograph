move 'climb trunk'
 if !checkpaths.include?('e') and !checkpaths.include?('ne')
 move 'west'
 move 'west'
 move 'west'
 move 'west'
 move 'northwest'
 move 'northwest'
 move 'west'
 end
 if checkpaths.include?('ne')
 move 'west'
 move 'southwest'
 move 'southwest'
 move 'southwest'
 move 'west'
 move 'west'
 end