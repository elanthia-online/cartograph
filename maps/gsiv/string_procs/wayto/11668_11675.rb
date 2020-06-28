move 'down'
 move 'out'
 if checkpaths.include?('ne')
 move 'northeast'
 move 'east'
 elsif !checkpaths.include?('e')
 move 'west'
 end