script = Script.self
sword = nil
sword_container = nil
close_containers = []
if UserVars.lootsack.nil? or UserVars.lootsack.empty?
	lootsack = GameObj.inv.find { |obj| obj.noun =~ /cloak|longcoat|backpack|pack/ }
else
	lootsack = GameObj.inv.find { |obj| obj.name =~ /#{Regexp.escape(UserVars.lootsack.strip)}/i } || GameObj.inv.find { |obj| obj.name =~ /#{Regexp.escape(UserVars.lootsack).sub(' ', ' .*')}/i }
end
find_all_containers_var = nil
find_all_containers = proc {
	if find_all_containers_var.nil?
		hp = proc { |ss| if ss =~ /^You are wearing/; DownstreamHook.remove('find_all_container_ids'); nil; else; ss; end }
		DownstreamHook.add('find_all_container_ids', hp)
		restore_silent = script.silent
		restore_want_downstream = script.want_downstream
		restore_want_downstream_xml = script.want_downstream_xml
		script.silent = true
		script.want_downstream = false
		script.want_downstream_xml = true
		clear
		put 'inventory containers'
		script.silent = restore_silent
		timeout = Time.now + 30
		container_ids = []
		while (Time.now < timeout) and (line = get)
			if line =~ /^You are wearing/
				container_ids = line.scan(/<a exist="([^"]+)"/).flatten
				break
			end
		end
		script.want_downstream = restore_want_downstream
		script.want_downstream_xml = restore_want_downstream_xml
		clear
		find_all_containers_var = container_ids.collect { |id| GameObj[id] }
	end
	find_all_containers_var
}
stow_sword = proc {
	if sword.nil?
		if GameObj.right_hand.noun == 'sword'
			sword = GameObj.right_hand
		elsif GameObj.left_hand.noun == 'sword'
			sword = GameObj.left_hand
		end
	end
	if sword
		if sword_container
			dothistimeout "_drag ##{sword.id} ##{sword_container.id}", 10, /^You put|^absent-mindedly drop|^You slip|^You tuck|^I could not find what you were referring to/
		else
			if lootsack
				dothistimeout "_drag ##{sword.id} ##{lootsack.id}", 10, /^You put|^absent-mindedly drop|^You slip|^You tuck|^You can't .+ It's closed!|^I could not find what you were referring to|^Your .*? won't fit in/
			end
			if (GameObj.right_hand.id == sword.id) or (GameObj.left_hand.id == sword.id)
				for container in find_all_containers.call
					next if container == lootsack
					dothistimeout "_drag ##{sword.id} ##{container.id}", 10, /^You put|^absent-mindedly drop|^You slip|^You tuck|^You can't .+ It's closed!|^I could not find what you were referring to|^Your .*? won't fit in/
					break unless (GameObj.right_hand.id == sword.id) or (GameObj.left_hand.id == sword.id)
				end
			end
		end
	end
}
empty_hands
if lootsack
	if lootsack.contents.nil?
		result = dothistimeout "open ##{lootsack.id}", 10, /^You open|^That is already open|^There doesn't seem to be any way to do that|^What were you referring to|^I could not find what you were referring to/
		if lootsack.contents.nil? and result =~ /^That is already open/
			dothistimeout "look in ##{lootsack.id}", 10, /^In the|^There is nothing|^That is closed|^What were you referring to|^I could not find what you were referring to/
		elsif result =~ /^You open/
			close_containers.push(lootsack)
		end
	end
	if sword = lootsack.contents.find { |obj| obj.name == 'short sword' }
		sword_container = lootsack
	end
end
if sword.nil?
	for container in find_all_containers.call
		next if container == lootsack
		if container.contents.nil?
			result = dothistimeout "open ##{container.id}", 10, /^You open|^That is already open|^There doesn't seem to be any way to do that|^What were you referring to|^I could not find what you were referring to/
			if container.contents.nil? and result =~ /^That is already open/
				dothistimeout "look in ##{container.id}", 10, /^In the|^There is nothing|^That is closed|^What were you referring to|^I could not find what you were referring to/
			elsif result =~ /^You open/
				close_containers.push(container)
			end
		end
		if sword = container.contents.find { |obj| obj.name == 'short sword' }
			sword_container = container
			break
		end
	end
end
if sword
	dothistimeout "_drag ##{sword.id} right", 10, /^You (?:carefully )?(?:remove|grab|draw|reach|slip|tuck)|^Get what/
else
	if $go2_get_silvers
		this_room = Room.current
		if Script.running.find_all { |s| s.name == 'go2' }.length > 1
			echo 'oh crap'
			for s in Script.running
				s.kill if s.name == 'go2' and s != Script.self
			end
			exit
		end
		force_start_script 'go2', [ 'bank', '--disable-confirm' ]
		wait_while { Script.running.find_all { |s| s.name == 'go2' }.length > 1 }
		fput 'unhide' if hidden? or invisible?
		fput 'withdraw 200'
		force_start_script 'go2', [ 'weaponshop', '--disable-confirm' ]
		wait_while { Script.running.find_all { |s| s.name == 'go2' }.length > 1 }
		fput 'unhide' if hidden? or invisible?
		fput 'order 3'
		fput 'buy'
		force_start_script 'go2', [ 'bank', '--disable-confirm' ]
		wait_while { Script.running.find_all { |s| s.name == 'go2' }.length > 1 }
		fput 'unhide' if hidden? or invisible?
		fput 'deposit all'
		force_start_script 'go2', [ this_room.id.to_s ]
		wait_while { Script.running.find_all { |s| s.name == 'go2' }.length > 1 }
	else
		echo 'You have no short sword! Use   ;go2 getsilvers=on   if you want this script to buy one for you.'
		close_containers.each { |c| fput "close ##{c.id}" }
		fill_hands
		exit
	end
end
if resolve = Spell[9704] and resolve.known? and resolve.affordable? and not resolve.active?
	resolve.cast
end
move 'go pool'
fput 'swim down'
fput 'kneel'
sleep 0.5
fput 'pry gap'
waitrt?
if Room.current.id == 22229
	fput 'swim up'
	fput 'go shore'
	waitrt?
	stow_sword.call
	close_containers.each { |c| fput "close ##{c.id}" }
	fill_hands
	$go2_restart = true
else
	waitrt?
	fput 'stand' until standing?
	waitrt?
	stow_sword.call
	close_containers.each { |c| fput "close ##{c.id}" }
	fill_hands
	$go2_restart = true
end
