if ((bounty? =~ /^You have made contact with the child/)||(Society.task =~ /You have been tasked to find and rescue an official who was captured/))
 mynpc = GameObj.npcs.find { |npc| npc.noun =~ /child|official/ }
 else
 mynpc = nil
end
 move 'south'
 if Room.current == Room[11153]
 50.times { break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
 sleep 0.1 } if mynpc
 move 'south'
 end