loop { fput 'search'
 fput 'turn bent spike'
 sleep 0.2
 break unless checkpaths == [ 'out' ] }
 wait_while { standing? }
 fput 'stand'
 if Room.current == Room[7144]
 move 'go door'
 move 'go hole'
 move 'go crack'
 end
 if Room.current == Room[7083]
 move 'go space'
 move 'east'
 end
 if Room.current == Room[7084]
 move 'east'
 move 'east'
 move 'south'
 move 'south'
 move 'east'
 move 'east'
 end
 if Room.current == Room[7099]
 move 'south'
 move 'west'
 end
 if Room.current == Room[7091]
 move 'go door'
 move 'go shaft'
 move 'south'
 move 'south'
 end
 if Room.current == Room[7047]
 move 'southwest'
 move 'southeast'
 move 'southeast'
 move 'northeast'
 move 'northeast'
 move 'climb rubble'
 move 'go opening'
 move 'north'
 move 'out'
 move 'south'
 move 'south'
 move 'south'
 move 'east'
 move 'north'
 move 'north'
 move 'north'
 end