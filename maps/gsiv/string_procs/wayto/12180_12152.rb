start_room = [ 12093, 12174, 12175, 12176, 12177, 12178, 12179, 12180, 12181, 12182, 12183, 12184, 12185, 12186, 12187, 12188, 20882, 20881, 20880, 12189, 12190, 12191, 12192, 12193, 12194, 12195, 12196, 12197, 12198, 12199, 12200, 12201, 20879, 12202, 12203, 12204, 12205, 12212, 12213, 12214, 20878, 20877, 12216, 20876, 12094, 12218, 12091, 12092, 12221, 12222, 12223, 12224, 12225, 12226, 12227 ]
 dirs = [ 'east', 'east', 'east', 'east', 'east', 'east', 'east', 'southeast', 'south', 'south', 'south', 'south', 'south', 'southwest', 'west', 'west', 'west', 'west', 'west', 'west', 'west', 'northwest', 'northwest', 'north', 'north', 'north', 'northeast', 'east', 'east', 'east', 'east', 'east', 'east', 'southeast', 'southeast', 'south', 'south', 'south', 'southwest', 'west', 'west', 'west', 'west', 'west', 'west', 'northwest', 'north', 'north', 'northeast', 'northeast', 'east', 'east', 'southeast', 'southeast', 'northwest', 'northwest', 'west', 'west', 'southwest', 'southwest', 'south', 'south', 'south', 'southeast', 'east', 'east', 'east', 'east', 'east', 'northeast', 'north', 'north', 'north', 'northwest', 'northwest', 'west', 'west', 'west', 'west', 'west', 'west', 'southwest', 'south', 'south', 'south', 'south', 'southeast', 'east', 'east', 'east', 'east', 'east', 'east', 'east', 'northeast', 'north', 'north', 'north', 'north', 'north', 'northwest', 'west', 'west', 'west', 'west', 'west', 'west', 'west' ]
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