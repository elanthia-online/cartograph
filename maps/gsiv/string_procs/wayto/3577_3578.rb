group_members = nil
 clear.reverse.each { |line| if line =~ /^Obvious (paths|exits)/
 break
 elsif line =~ /^([A-Za-z ,]+) followed\.$/
 group_members = $1.split(/, | and /)
 group_members.delete_if { |m| m =~ /^[Yy]our / }
 group_members = nil if group_members.empty?
 break
 end }
 move 'climb stair'
 if group_members
 echo "Waiting for your group... "
 begin
 if get =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
 group_members.delete $2
 end
 end while group_members.length > 0
 end
 waitrt?