$group_members = nil
 clear.reverse.each { |line| if line =~ /^Obvious (paths|exits)/
 break
 elsif line =~ /^([A-Za-z ,]+) followed\.$/
 $group_members = $1.split(/, | and /)
 $group_members.delete_if { |m| m =~ /^[Yy]our / }
 $group_members = nil if $group_members.empty?
 break
 end }
 empty_hands
 start_pcs = checkpcs
 fput 'look ladder'
 rope_status = waitfor('The rope ladder is not being used by anyone at the moment.', 'is climbing the rope ladder')
 unless rope_status == 'The rope ladder is not being used by anyone at the moment.'
 waitfor('climbs down the rest of the ladder slowly', 'climbs the remaining few rungs of the ladder')
 end
 if start_pcs
 loop { fput 'look'
 break unless checkpcs
 waiting_pcs = start_pcs & checkpcs
 break if waiting_pcs.empty?
 echo 'Giving the people here before you 30 seconds...'
 sleep 30
 fput 'look ladder'
 rope_status = waitfor('The rope ladder is not being used by anyone at the moment.', 'is climbing the rope ladder')
 if rope_status == 'The rope ladder is not being used by anyone at the moment.'
 break
 else
 waitfor('climbs down the rest of the ladder slowly', 'climbs the remaining few rungs of the ladder')
 end }
 end
 move 'climb ladder'
 waitrt?