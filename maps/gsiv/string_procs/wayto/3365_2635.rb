6.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Birthing Sands, Cavern of Ages|Nightmare Gorge|Abbey,? Cellar|A Frozen Garden|Frozen Bramble Patch)/
 if result == '[Birthing Sands, Cavern of Ages]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }