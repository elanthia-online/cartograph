if (bounty? =~ /^You have made contact with the child/)
 child = GameObj.npcs.find { |npc| npc.noun == 'child' }
 else
 child = nil
 end
loop { 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 move 'southeast'
 break if Room.current.id != 7872
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 move 'southwest'
 break if Room.current.id != 7872
 }