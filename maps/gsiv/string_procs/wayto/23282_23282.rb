hot_rooms = [23282,23283,23284,23285,23286,23287,23288,23289,23290,23291,23292,23293,23294,23295,23296,23297,23298,23299,23300,23301,23302,23303,23329,23330,23331,23332,23333,23334]
 cold_rooms = [23304,23305,23306,23307,23308,23309,23310,23311,23312,23313,23314,23315,23316,23317,23318,23319,23320,23321,23322,23323,23324,23325,23326,23327,23328]
 $mapdb_confluence_wayto ||= Hash.new
 $mapdb_confluence_wander ||= Array.new
 loop { start_room = Room.current
 break if start_room.id == $mapdb_confluence_target
 if hot_rooms.include?(start_room.id)
 hot = true
 elsif cold_rooms.include?(start_room.id)
 hot = false
 else
 $go2_restart = true
 break
 end
 if GameObj.loot.any? { |o| o.name == 'point of elemental tranquility' }
 if hot
 $mapdb_confluence_hot_tranquility = start_room.id
 else
 $mapdb_confluence_cold_tranquility = start_room.id
 end
 elsif $mapdb_confluence_hot_tranquility == start_room.id
 $mapdb_confluence_hot_tranquility = nil
 elsif $mapdb_confluence_cold_tranquility == start_room.id
 $mapdb_confluence_cold_tranquility = nil
 end
 if GameObj.loot.any? { |o| o.name == 'gaping bottomless pit' }
 if hot
 $mapdb_confluence_hot_pit = start_room.id
 else
 $mapdb_confluence_cold_pit = start_room.id
 end
 elsif $mapdb_confluence_hot_pit == start_room.id
 $mapdb_confluence_hot_pit = nil
 elsif $mapdb_confluence_cold_pit == start_room.id
 $mapdb_confluence_cold_pit = nil
 end
 if $mapdb_confluence_wayto[start_room.id].nil?
 wayto = Hash.new
 XMLData.room_exits.each { |d| wayto[d] = nil }
 redo if Room.current != start_room
 $mapdb_confluence_wayto[start_room.id] = wayto
 end
 if ($mapdb_confluence_wayto[start_room.id].keys != XMLData.room_exits)
 redo if Room.current != start_room
 $mapdb_confluence_wayto = Hash.new
 redo
 end
 child = ((bounty? =~ /^You have made contact with the child/) ? GameObj.npcs.find { |npc| npc.noun == 'child' } : nil)
 dir_to = proc { |targets| dir = nil
 tried = Array.new
 30.times { break if dir = $mapdb_confluence_wayto[start_room.id].keys.find { |d| targets.include?($mapdb_confluence_wayto[start_room.id][d]) }
 targets.each { |i| tried.push(i) unless tried.include?(i) }
 ot = targets
 targets = $mapdb_confluence_wayto.keys.find_all { |k| $mapdb_confluence_wayto[k].values.any? { |i| ot.include?(i) } and not tried.include?(k) }
 break if targets.empty? }
 dir }
 dir = nil
 if $mapdb_confluence_target == 'tranquility'
 if GameObj.loot.any? { |o| o.name == 'point of elemental tranquility' }
 move 'go tranquility'
 $go2_restart = true
 break
 end
 if hot and $mapdb_confluence_hot_tranquility
 dir = dir_to.call([$mapdb_confluence_hot_tranquility])
 elsif not hot and $mapdb_confluence_cold_tranquility
 dir = dir_to.call([$mapdb_confluence_cold_tranquility])
 end
 else
 if hot and cold_rooms.include?($mapdb_confluence_target)
 if GameObj.loot.any? { |o| o.name == 'gaping bottomless pit' }
 move 'go pit'
 redo
 end
 dir = dir_to.call([$mapdb_confluence_hot_pit]) if $mapdb_confluence_hot_pit
 elsif not hot and hot_rooms.include?($mapdb_confluence_target)
 if GameObj.loot.any? { |o| o.name == 'gaping bottomless pit' }
 move 'go pit'
 redo
 end
 dir = dir_to.call([$mapdb_confluence_cold_pit]) if $mapdb_confluence_cold_pit
 else
 dir = dir_to.call([$mapdb_confluence_target])
 end
 end
 dir ||= dir_to.call([nil])
 dir ||= $mapdb_confluence_wayto[start_room.id].keys.find { |d| not $mapdb_confluence_wander.include?($mapdb_confluence_wayto[start_room.id][d]) }
 if dir.nil?
 next_id = $mapdb_confluence_wander.find { |i| $mapdb_confluence_wayto[start_room.id].values.include?(i) }
 dir = $mapdb_confluence_wayto[start_room.id].keys.find { |d| $mapdb_confluence_wayto[start_room.id][d] == next_id }
 end
 r = move(dir.dup)
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 if r == false
 status_tags
 result = dothistimeout 'look', 5, /<compass>/
 status_tags
 options = result.scan(/<dir value="(.*?)"/).flatten
 move options[rand(options.length)]
 else
 end_room = Room.current
 redo if end_room.id == start_room.id
 $mapdb_confluence_wayto[start_room.id][dir] = end_room.id
 $mapdb_confluence_wander.delete(end_room.id)
 $mapdb_confluence_wander.push(end_room.id)
 end }