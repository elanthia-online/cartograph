loop { result = dothistimeout 'pull lever', 3, /Ok, you pull a heavy steel lever protruding from a slit in one wall.  Now what|Summoning all your strength, you manage to pull a heavy steel lever protruding from a slit in one wall back just enough to raise a wooden drawbridge|You try to pull the heavy steel lever, but it won't budge!/
 waitrt?
 break if result =~ /Ok, you pull a heavy steel lever protruding from a slit in one wall.  Now what?|Summoning all your strength, you manage to pull a heavy steel lever protruding from a slit in one wall back just enough to raise a wooden drawbridge/ }
 move 'go white portcullis'