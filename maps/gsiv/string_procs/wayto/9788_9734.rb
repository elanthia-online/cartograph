next_exit = { 9823 => [ 'southeast', 'southwest', 'southwest', 'east', 'southwest', 'southeast', 'south' ], 9818 => [ 'east', 'southwest', 'west', 'west', 'northeast', 'northeast', 'northwest' ], 9808 => [ 'east', 'east', 'east', 'northeast', 'west' ], 9788 => [ 'southwest', 'southeast', 'southwest' ], 9784 => [ 'southeast', 'south', 'northeast', 'north', 'west', 'west', 'west' ] }
 loop { if move 'go root'
 nil until get == '[Maaghara Tower, Refuse Heap]'
 fput 'stand' unless standing?
 waitrt?
 break
 else
 if dir_list = next_exit[Room.current.id]
 dir_list.each { |dir| move dir }
 else
 echo 'error: out of cheese'
 break
 end
 end }