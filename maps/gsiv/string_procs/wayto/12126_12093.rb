start_room = [ 12135, 12118, 12102, 2634, 12134, 12116, 12112, 12089, nil, 12115, 12144, 12111, 12114, 12088, 12109, 12110, 12150, 12149, 12148, 12143, 12147, nil, 12142, 12137, 12136, nil, nil, nil, 12120, 12131, 12132, 12113, 2643, 12155, 12154, nil, 12121, 12129, 12130, 12158, 12105, 12107, 12108, nil, nil, nil, nil, nil, nil, 2619, 12127, 12128, 12166, 12104, 12163, 12164, nil, 12117, nil, 12123, 12124, 12101, nil, 12126, 12167, nil, 12168, 12169, 12100, nil, 12171, 12172 ]
 dirs = [ 'northwest', 'east', 'southeast', 'southwest', 'northwest', 'south', 'southeast', 'northwest', 'south', 'south', 'southeast', 'southwest', 'southeast', 'west', 'west', 'west', 'west', 'west', 'northwest', 'northwest', 'southeast', 'northeast', 'northwest', 'northeast', 'northwest', 'northeast', 'northwest', 'east', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'east', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'southwest', 'northeast', 'northwest', 'northeast', 'northwest', 'northeast', 'northwest', 'east', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'southeast', 'northwest', 'southwest', 'southeast', 'east', 'southeast', 'north', 'south', 'southwest', 'east', 'west', 'southeast', 'southwest', 'east', 'west', 'southeast', 'southwest', 'northeast', 'northwest', 'northeast', 'northwest', 'northeast', 'northwest', 'west', 'west', 'west', 'west', 'west', 'southeast' ]
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