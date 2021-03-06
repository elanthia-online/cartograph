ticket_nouns = [ 'scrip', 'scroll', 'document', 'parchment', 'paper', 'note' ]
 check_ticket = proc { |test_id| look_result = dothistimeout "look ##{test_id}", 3, /reads, ".*#{checkname}|^You see nothing unusual\.|^It takes you a moment to focus|[0-9]+ silver/
 if look_result =~ /reads, ".*#{checkname}/
 test_id
 else
 nil
 end }
 force_go2 = proc { |room_num| go2_count = Script.running.find_all { |s| s.name == 'go2' }.length
 force_start_script 'go2', [ room_num.to_s ]
 wait_while { Script.running.find_all { |s| s.name == 'go2' }.length > go2_count } }
 ticket_id = nil
 if ticket_nouns.include?(GameObj.right_hand.noun)
 ticket_id = check_ticket.call(GameObj.right_hand.id)
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
 container.contents.find_all { |obj| ticket_nouns.include?(obj.noun) }.each { |obj| break if ticket_id = check_ticket.call(obj.id) }
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
 if container = GameObj.inv.find { |obj| obj.id == container_id }
 open_result = dothis "open ##{container.id}", /^You open|^That is already open\.$/
 if open_result == 'That is already open.'
 fput "look in ##{container.id}"
 end
 container.contents.find_all { |obj| ticket_nouns.include?(obj.noun) }.each { |obj| break if ticket_id = check_ticket.call(obj.id) }
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
 end
 unless ticket_id
 echo 'failed to find your ticket'
 if $go2_get_silvers
 echo 'going to buy one...'
 sleep 2
 force_go2.call(11748)
 fput 'unhide' if hidden? or invisible?
 ask_result = dothis 'ask percy about ticket', /^Percy whispers, "Look \-\- I need [0-9]+ coins for something like that\.|^Percy quietly takes your money/
 if ask_result =~ /^Percy whispers, "Look -- I need ([0-9]+) coins for something like that\./
 cost = $1
 force_go2.call(10911)
 fput 'unhide' if hidden? or invisible?
 withdraw_result = dothis "withdraw #{cost} silvers", /hands you [0-9]+ silvers|don't seem to have that much/
 unless withdraw_result =~ /hands you [0-9]+ silvers/
 echo "you are too poor to go to Solhaven"
 exit
 end
 force_go2.call(11748)
 fput 'unhide' if hidden? or invisible?
 ask_result = dothis 'ask percy about ticket', /^Percy quietly takes your money/
 end
 force_go2.call(18677)
 else
 echo 'for automatic ticket buying, use   
go2 getsilvers=on'
 exit
 end
 end
 fput 'unhide' if (hidden? or invisible?) and checkloot.include?('gangplank')
 unless checkloot.include?('gangplank') and move('go gangplank')
 echo 'waiting for the cutter...'
 line = get until line =~ /^A small cutter glides up beneath the bridge.  The crew swiftly extends a gangplank\.|^You hear a voice on the cutter shouting, "Are the passengers all aboard\?"/
 fput 'unhide' if hidden? or invisible?
 move 'go gangplank'
 end