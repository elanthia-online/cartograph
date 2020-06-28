ticket_nouns = [ 'scrip', 'scroll', 'document', 'parchment', 'paper', 'note' ]
check_ticket = proc { |test_id|
look_result = dothistimeout "look ##{test_id}", 3, /reads, ".*#{checkname}|^You see nothing unusual\.|^It takes you a moment to focus|[0-9]+ silver/
if look_result =~ /reads, ".*#{checkname}/
test_id
else
nil
end
}
if ticket_nouns.include?(GameObj.right_hand.noun)
ticket_id = check_ticket.call(GameObj.right_hand.id)
else
ticket_id = nil
end
unless ticket_id
if ticket_nouns.include?(GameObj.left_hand.noun)
if ticket_id = check_ticket.call(GameObj.left_hand.id)
fput 'swap'
end
end
end
unless ticket_id
empty_hands
checked_containers = Array.new
for container in GameObj.inv
unless container.contents.nil? or container.contents.empty?
checked_containers.push(container.id)
for item in container.contents
if ticket_nouns.include?(item.noun)
break if ticket_id = check_ticket.call(item.id)
end
end
end
break if ticket_id
end
if ticket_id
fput "get ##{ticket_id}"
end
end
unless ticket_id
status_tags
inv_result = dothis 'inventory containers', /^You are wearing/
status_tags
container_list = inv_result.scan(/exist="([0-9]+)"/).flatten
for container_id in (container_list - checked_containers)
container = GameObj.inv.find { |obj| obj.id == container_id }
next unless container
open_result = dothis "open ##{container.id}", /^You open|^That is already open\.$/
if open_result == 'That is already open.'
fput "look in ##{container.id}"
end
for item in container.contents
if ticket_nouns.include?(item.noun)
break if ticket_id = check_ticket.call(item.id)
end
end
if ticket_id
fput "get ##{ticket_id}"
if open_result =~ /^You open/
fput "close ##{container.id}"
end
break
else
if open_result =~ /^You open/
fput "close ##{container.id}"
end
end
end
end
unless ticket_id
echo 'failed to find your ticket'
if $go2_get_silvers.nil?
echo 'update go2 for automatic ticket buying'
exit
elsif $go2_get_silvers
echo 'going to buy one...'
sleep 3
move 'north'
move 'east'
move 'north'
move 'northwest'
move 'west'
move 'west'
move 'go storefront'
fput 'unhide' if hidden? or checkspell(916)
ask_result = dothis 'ask jyhm about ticket', /^Jyhm whispers, "Look -- I need [0-9]+ coins for something like that\.|^Jyhm quietly takes your money/
if ask_result =~ /^Jyhm whispers, "Look -- I need ([0-9]+) coins for something like that\./
cost = $1
move 'out'
move 'east'
move 'east'
move 'southeast'
move 'south'
move 'east'
move 'go bridge'
move 'up'
move 'southeast'
move 'southeast'
move 'down'
move 'southeast'
move 'east'
move 'south'
move 'south'
move 'east'
move 'go doors'
fput 'unhide' if hidden? or checkspell(916)
withdraw_result = dothis "withdraw #{cost} silvers", /hands you [0-9]+ silvers|don't seem to have that much/
unless withdraw_result =~ /hands you [0-9]+ silvers/
echo "you are too poor to go to River's Rest"
exit
end
move 'out'
move 'west'
move 'north'
move 'north'
move 'west'
move 'northwest'
move 'up'
move 'northwest'
move 'northwest'
move 'down'
move 'northwest'
move 'west'
move 'north'
move 'northwest'
move 'west'
move 'west'
move 'go storefront'
fput 'unhide' if hidden? or checkspell(916)
ask_result = dothis 'ask jyhm about ticket', /^Jyhm quietly takes your money/
end
move 'out'
move 'east'
move 'east'
move 'southeast'
move 'south'
move 'west'
move 'go pier'
else
echo 'for automatic ticket buying, use 
go2 getsilvers=on'
exit
end
end
fput 'unhide' if (hidden? or checkspell(916)) and checkloot.include?('gangplank')
unless checkloot.include?('gangplank') and move('go gangplank')
echo 'waiting for the cutter...'
line = get until line =~ /The crew swiftly extends a gangplank\.|^You hear a voice on the cutter shouting, "Are the passengers all aboard\?"/
fput 'unhide' if hidden? or checkspell(916)
move 'go gangplank'
end