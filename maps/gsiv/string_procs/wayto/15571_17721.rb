
elements = {
	'air' => {	'grey orb' => 505,
			'blue orb' => 914,
			'white orb' => 912 },
	'fire' => {	'blue flame' => 908,
			'scarlet flame' => 519,
			'white flame' => 906 },
	'earth' => {	'blue crystal' => 520,
			'black crystal' => 510,
			'violet crystal' => 909 }
}

direction = {
	'air' => 'north',
	'fire' => 'west',
	'earth' => 'south'
}

result = nil
['air','fire','earth'].each { |element|
	truth_table = elements[element].values.find_all { |spellnum| Spell[spellnum].known? }
	if truth_table.size == 3
		result = element
		break
	end
}

if result.nil?
	echo 'You do not know enough spells to get into the workshop.'
	exit
end

2.times{ move direction[result] }
elements[result].each{ |pillar, spellnum|
	if !Spell[spellnum].affordable?
		echo 'Waiting for mana'
		wait_until{ Spell[spellnum].affordable? }
	end
	Spell[spellnum].cast(pillar)
}
