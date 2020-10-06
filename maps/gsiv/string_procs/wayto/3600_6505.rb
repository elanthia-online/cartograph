9.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Graveyard|Darkstone, Dungeon|Upper Trollfang, Winding Trees|Castle Varunar, Great Hall|Red Forest, Inner Weald|Monastery, Misty Chamber|Pentagram Chamber|Coastal Cliffs, Cemetery)/
 if result == '[Monastery, Misty Chamber]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }