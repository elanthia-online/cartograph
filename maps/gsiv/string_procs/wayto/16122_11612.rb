move ['northwest','southwest'][rand(2)] while checkpaths == [ 'ne', 'se', 'sw', 'nw' ]
 move 'northwest' if checkpaths.include?('nw')
 move 'west' if checkpaths.include?('w')