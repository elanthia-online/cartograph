loop { move 'north'
 break if Room.current.id != 4136
 move 'northeast'
 break if Room.current.id != 4136
 }