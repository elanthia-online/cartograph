4.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:High Plains, Moorgate|Wraithenmist, Fishing Dock|Maaghara Labyrinth)/
 if result == '[High Plains, Moorgate]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }