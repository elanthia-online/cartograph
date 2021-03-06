target_room_id = 6194
 maze_rooms = [6191, 6254, 6252, 6250, 6195, 6197, 6199, 6249, 6198, 6248, 6196, 6251, 6192, 6193, 6194, 6253]
 $minotaur_maze_dirs ||= Hash.new
 loop { if (bounty? =~ /^You have made contact with the child/)
 child = GameObj.npcs.find { |npc| npc.noun == 'child' }
 else
 child = nil
 end
 start_room = Room.current
 $minotaur_maze_dirs[start_room.id] ||= Hash.new
 dir = $minotaur_maze_dirs[start_room.id].keys.find { |d| $minotaur_maze_dirs[start_room.id][d] == target_room_id } || XMLData.room_exits.find { |d| $minotaur_maze_dirs[start_room.id][d].nil? } || $minotaur_maze_dirs[start_room.id].keys.find { |d| $minotaur_maze_dirs[$minotaur_maze_dirs[start_room.id][d]].values.include?(target_room_id) } || XMLData.room_exits[rand(XMLData.room_exits.length)]
 move dir.dup
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 end_room = Room.current
 $minotaur_maze_dirs[start_room.id][dir] = end_room.id
 if end_room.id == target_room_id
 break
 elsif not maze_rooms.include?(end_room.id)
 dir = end_room.wayto[start_room.id.to_s]
 if dir.class == Proc
 dir.call
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 elsif dir.class == String
 move dir.dup
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 end
 end }