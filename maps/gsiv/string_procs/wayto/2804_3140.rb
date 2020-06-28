5.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:A Frozen Garden|Birthing Sands, Cavern of Ages|Nightmare Gorge|Abbey Cellar)/
 if result == '[A Frozen Garden]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }