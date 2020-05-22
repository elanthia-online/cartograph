
	fput "open door"
	while line = get
		if line =~ /That is already open\./
			break
		elsif line =~ /There doesn't seem to be any way to do that\./
			if GameObj.right_hand.type == "gem"
				fput "put ##{GameObj.right_hand.id} in vaalorn door"
				break
			else
				echo "In order to get past this door you must sacrifice a gem.\n Place a cheap gem in your right hand and unpause the script (;unpause) to continue."
				pause_script
				wait_until{GameObj.right_hand.name !~ /Empty/}
				fput "put ##{GameObj.right_hand.id} in vaalorn door"
				break
			end
		end
	end
	fput "go door"
