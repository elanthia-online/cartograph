result = dothistimeout 'look pillar', 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if result =~ /dark eye/
	loop{
		wait_until{Spell[717].affordable?}
		result = cast(717, 'pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /hazy black/
	loop{
		wait_until{Spell[704].affordable?}
		result = cast(704, 'pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /slate grey/
	loop{
		wait_until{Spell[705].affordable?}
		result = cast(705, 'pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /blood-drop/
	loop{
		wait_until{Spell[701].affordable?}
		result = cast(701, 'pillar')
		if result =~ /Cast Roundtime/
			break		end
	}
elsif result =~ /radiating circle/
	loop{
		wait_until{Spell[702].affordable?}
		result = cast(702, 'pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /dark cloud/
	loop{
		wait_until{Spell[703].affordable?}
		result = cast(703, 'pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
end
result = dothistimeout 'look other pillar', 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if result =~ /dark eye/
	loop{
		wait_until{Spell[717].affordable?}
		result = cast(717, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /hazy black/
	loop{
		wait_until{Spell[704].affordable?}
		result = cast(704, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /slate grey/
	loop{
		wait_until{Spell[705].affordable?}
		result = cast(705, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /blood-drop/
	loop{
		wait_until{Spell[701].affordable?}
		result = cast(701, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /radiating circle/
	loop{
		wait_until{Spell[702].affordable?}
		result = cast(702, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /dark cloud/
	loop{
		wait_until{Spell[703].affordable?}
		result = cast(703, 'other pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
end
result = dothistimeout 'look third pillar', 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if result =~ /dark eye/
	loop{
		wait_until{Spell[717].affordable?}
		result = cast(717, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /hazy black/
	loop{
		wait_until{Spell[704].affordable?}
		result = cast(704, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /slate grey/
	loop{
		wait_until{Spell[705].affordable?}
		result = cast(705, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /blood-drop/
	loop{
		wait_until{Spell[701].affordable?}
		result = cast(701, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /radiating circle/
	loop{
		wait_until{Spell[702].affordable?}
		result = cast(702, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /dark cloud/
	loop{
		wait_until{Spell[703].affordable?}
		result = cast(703, 'third pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
end
result = dothistimeout 'look fourth pillar', 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if result =~ /dark eye/
	loop{
		wait_until{Spell[717].affordable?}
		result = cast(717, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /hazy black/
	loop{
		wait_until{Spell[704].affordable?}
		result = cast(704, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /slate grey/
	loop{
		wait_until{Spell[705].affordable?}
		result = cast(705, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /blood-drop/
	loop{
		wait_until{Spell[701].affordable?}
		result = cast(701, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /radiating circle/
	loop{
		wait_until{Spell[702].affordable?}
		result = cast(702, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
elsif result =~ /dark cloud/
	loop{
		wait_until{Spell[703].affordable?}
		result = cast(703, 'fourth pillar')
		if result =~ /Cast Roundtime/
			break
		end
	}
end