4.times { result = dothistimeout 'symbol of seeking', 3, /^\[(Luukos' Gullet, Overhang|Temple of Luukos, Steam Chamber|Ruined Temple, Nexus)/
 if result == '[Luukos\' Gullet, Overhang]'
 dothistimeout 'symbol of seeking confirm', 3, /^Your surroundings blur into a white fog \. \. \./
 break
 end }