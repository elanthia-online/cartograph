if resolve = Spell[9704] and resolve.known? and resolve.affordable? and not resolve.active?
 resolve.cast
 end
 move 'swim river'
 waitrt?