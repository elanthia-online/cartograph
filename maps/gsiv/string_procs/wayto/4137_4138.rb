loop { move 'north'
 break if Room.current.id != 4137
 move 'northeast'
 break if Room.current.id != 4137
 }