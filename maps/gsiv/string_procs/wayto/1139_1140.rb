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
 look_result = dothistimeout 'look rope', 8, /No one is currently crossing the river on the rope\.|is currently hanging on the/
 unless look_result =~ /No one is currently crossing the river on the rope\./
 loop { break if get =~ /shuffles slowly across the rope and hops off of it/ }
 end
 if start_pcs
 loop { break unless checkpcs
 waiting_pcs = start_pcs & checkpcs
 break if waiting_pcs.empty?
 echo 'Giving the people here before you 30 seconds...'
 sleep 30
 look_result = dothistimeout 'look rope', 8, /No one is currently crossing the river on the rope\.|is currently hanging on the/
 if look_result =~ /No one is currently crossing the river on the rope\./
 break
 else
 loop { break if get =~ /shuffles slowly across the rope and hops off of it/ }
 end }
 end
 move 'climb rope'
 waitrt?