while checkpaths == ['ne', 'se', 'sw', 'nw']
 move ['northwest','southwest'][rand(2)]
 end
 move 'west' while checkpaths.include?('w')