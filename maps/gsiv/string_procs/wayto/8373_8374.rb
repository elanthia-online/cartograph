wedge_list = { 'northern' => 'a large thick torus surrounded by nine tiny circles', 'eastern' => 'two crossed upside-down hammers circumscribed by a rounded arc', 'western' => 'a jagged triangular arch bisected by a vertical line', 'southern' => 'three pairs of obliquely intersecting parallel lines' }

 wedge_list.each_pair { |direction,position|
	 loop {
		wedge_look = dothis "look #{direction} wedge", /^The stone ring's #{direction} wedge is currently pointed at a sigil of (three pairs of obliquely intersecting parallel lines|two crossed upside-down hammers circumscribed by a rounded arc|a jagged triangular arch bisected by a vertical line|a large thick torus surrounded by nine tiny circles)\./
		break if wedge_look =~ /#{position}/
		fput 'turn ring'
	 }
	 fput "push #{direction} wedge"
 }