8.times { if celerity = Spell[506] and celerity.known? and celerity.affordable? and not celerity.active?
 celerity.cast
 end
 dothistimeout 'search', 3, /You make a careful search of the area and discover a narrow icy ledge!|You don't find anything of interest here./
 break if move 'go ledge' }