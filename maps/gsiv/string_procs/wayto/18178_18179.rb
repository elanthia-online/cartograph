put 'look rune';while line = get;if line =~ /All the steps are in position, forming a complete staircase./;put 'go stair';break;elsif line =~ /The last one, labeled E, is directly under the R rune./;put 'push s rune';elsif line =~ /The last one, labeled E, is directly under the S rune./;put 'push o rune';elsif line =~ /The last one, labeled E, is directly under the O rune./;put 'push r rune';elsif line =~ /The last one, labeled E, is directly under the Z rune./;put 'push z rune';elsif line =~ /Nothing happens./;put 'press e rune';put 'look rune';elsif line =~ /It is now lined up under the/;put 'look rune';end;end