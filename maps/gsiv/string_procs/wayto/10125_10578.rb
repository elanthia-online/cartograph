4.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Lunule Weald, Perish Glen|Plains of Bone, Ruins|Red Forest, Inner Weald)/
 if result == '[Lunule Weald, Perish Glen]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }