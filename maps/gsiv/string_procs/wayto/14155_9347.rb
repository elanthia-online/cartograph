6.times { result = dothistimeout 'symbol of seeking', 3, /^\[(?:Ruined Courtyard|Deep Woods, Overgrowth|Vornavis, Wooded Plains|Abandoned Village|Castle Varunar, Great Hall)/
 if result == '[Abandoned Village]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }