40.times { sleep 0.1
 break if GameObj.loot.any? { |obj| obj.name =~ /#{Char.name} disk$/ } }
 unless GameObj.loot.any? { |obj| obj.name =~ /#{Char.name} disk$/ }
 disk = Spell[511]
 wait_until { disk.affordable? }
 disk.cast
 end
 move 'down'