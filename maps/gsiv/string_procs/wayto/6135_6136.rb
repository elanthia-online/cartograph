group_members = nil
 clear.reverse.each { |line| if line =~ /^Obvious (paths|exits)/
 break
 elsif line =~ /^([A-Za-z ,]+) followed\.$/
 group_members = $1.split(/, | and /)
 group_members.delete_if { |m| m =~ /^[Yy]our / }
 group_members = nil if group_members.empty?
 break
 end }
 result = nil
 while !result
 if celerity = Spell[506] and celerity.known? and celerity.affordable? and not celerity.active?
 celerity.cast
 end
 fput 'search'
 result = matchtimeout(1,/you discover a narrow crevice/)
 waitrt?
 if !result then multimove 'n','s'
 end
 end
 fput 'point crevice' if group_members
 move 'go crevice'
 if group_members
 echo 'Waiting for your group... To ditch them, 
send go '
 while (group_members.length > 0) and (line = get)
 if line =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
 group_members.delete $2
 elsif line == 'go'
 break
 end
 end
 end