4.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Citadel, Outside|Marsh Keep, Inner Portcullis|Oteska's Haven, Niima's Shrine|Council War Room)/
 if result == '[Citadel, Outside]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }