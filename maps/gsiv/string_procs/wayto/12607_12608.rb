10.times { if celerity = Spell[506] and celerity.known? and celerity.affordable? and not celerity.active?
 celerity.cast
 end
 dothistimeout 'search', 3, /^You (?:carefully )?search|^You don't find anything|^You find nothing else/
 waitrt?
 r = dothistimeout 'get root', 3, /^I could not find|^You reach out|^Get what?/
 break if r =~ /^You reach out/ }
 empty_hands
 move 'climb face'
 waitrt?
 fill_hands