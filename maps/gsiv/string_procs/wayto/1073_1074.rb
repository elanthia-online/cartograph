move 'climb up'
waitrt?
fill_hands
if $group_members
clear
echo "Waiting for your group... To ditch them, 
send go "
begin
line = get
if line =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
$group_members.delete $2
elsif line == 'go'
break
end
end while $group_members.length > 0
end