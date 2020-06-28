move ['northwest','southwest'][rand(2)] while checkpaths == [ 'ne', 'se', 'sw', 'nw' ]
 move 'east' if checkpaths.include?('e')
 move 'southeast' if checkpaths.include?('se')