start_room = [ 12162, 12207, 12170, 12209, 12215, 12210, 12159, 12165, 12206, 12173, 12208, nil, 12160, 12211 ]
 dirs = [ 'northwest', 'north', 'northeast', 'northwest', 'northeast', 'northwest', 'northeast', 'north', 'northwest', 'west', 'east', 'northeast', 'northwest', 'northeast' ]
 if index = start_room.index(Room.current.id)
 until checkloot.include?('thread')
 move dirs[index]
 index += 1
 index = 0 if index >= dirs.length
 end
 move 'climb thread'
 waitrt?
 fput 'stand'
 else
 echo 'error: mini-script expected a different room'
 end
 $go2_restart = true