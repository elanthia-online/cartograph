4.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Lunule Weald, Perish Glen|Plains of Bone, Ruins|Red Forest, Inner Weald)/
 if result == '[Red Forest, Inner Weald]'
 UserVars.mapdb_redforest_location = 'EN'
 UserVars.REDFOREST_ENTRANCE = 16744
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }