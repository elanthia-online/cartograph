group_members = nil
 clear.reverse.each { |line| if line =~ /^Obvious (paths|exits)/
 break
 elsif line =~ /^([A-Za-z ,]+) followed\.$/
 group_members = $1.split(/, | and /)
 group_members.delete_if { |m| m =~ /^[Yy]our / }
 group_members = nil if group_members.empty?
 break
 end }
 fput 'yell jaron galarn'
 sleep 1
 until checkpaths.include?('s')
 fput 'stand' unless standing?
 fput 'search'
 waitrt?
 fput 'go opening'
 sleep 0.2
 end
 fput 'stand' unless standing?
 if (group_members.to_a.length > 0)
 echo 'Waiting for your group... To ditch them, 
send go'
 wait_until { (group_members.to_a - GameObj.pcs.to_a.delete_if { |pc| not pc.status.nil? }.collect { |pc| pc.name }).empty? or clear.find { |line| line == 'go' } }
 end