if (bounty? =~ /^You have made contact with the child/)
 child = GameObj.npcs.find { |npc| npc.noun == 'child' }
 else
 child = nil
 end
 move 'southwest'
 if Room.current == Room[7313]
 50.times { break if GameObj.npcs.any? { |npc| npc.id == child.id }
 sleep 0.1 } if child
 move 'southwest'
 end