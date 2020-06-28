start_room = [ 12095, 12096, 12156, 12097, 12098, nil, 12151, 12133, 12152, 12248, 12139, 12106, nil, nil, 12138, 12146, 12153, 12122, 12157, 12145, 12125, 12141, 12140, 12119, 12252, 12103 ]
 dirs = [ 'southwest', 'southwest', 'west', 'northwest', 'southeast', 'southwest', 'northwest', 'northeast', 'west', 'southwest', 'southeast', 'northwest', 'northeast', 'northwest', 'northeast', 'northwest', 'northeast', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'southeast', 'southeast', 'southwest', 'southeast', 'southwest', 'southeast', 'southeast', 'east', 'northeast', 'northeast' ]
 if index = start_room.index(Room.current.id)
 until checkloot.include?('fissure')
 move dirs[index]
 index += 1
 index = 0 if index >= dirs.length
 end
 5.times { waitrt?
 fput 'stand' unless standing?
 waitrt?
 result = dothistimeout 'push fissure', 3, /^Grasping the distorted edges|^A wide fissure cannot be opened any farther\.|^As you move to touch a sealed fissure|^What were you referring to\?/
 waitrt?
 fput 'stand' unless standing?
 waitrt?
 break if result =~ /^A wide fissure cannot be opened any farther\./ }
 move 'go fissure'
 else
 echo 'error: mini-script expected a different room'
 end
 $go2_restart = true