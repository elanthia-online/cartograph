d='west'
fput 'go sphere'
put d
32.times{dothistimeout d, 1, /^You are surrounded by an ethereal fog\.$/}
dothistimeout d, 1, /^You feel every shred of yourself torn to tiny pieces and reformed/
line = get until line =~ /^You open your eyes and blink twice/
fput 'stand' unless standing?