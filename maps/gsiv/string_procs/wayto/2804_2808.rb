5.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:A Frozen Garden|Birthing Sands, Cavern of Ages|Nightmare Gorge|Abbey,? Cellar)/
 if result == '[Nightmare Gorge]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }