number = { '1' => 'first', '2' => 'second', '3' => 'third', '4' => 'fourth', '5' => 'fifth' }
 result = dothistimeout 'look altar', 10, /^There is a strange grid on the altar.  Five rows are labeled with numbers and five columns are labeled with colors.  A red glow illuminates/
 lever_hash = Hash.new
 lever_hash['yellow'] = number[result.slice(/Yellow [0-9]/).slice(/[0-9]/)]
 lever_hash['blue'] = number[result.slice(/Blue [0-9]/).slice(/[0-9]/)]
 lever_hash['brown'] = number[result.slice(/Brown [0-9]/).slice(/[0-9]/)]
 lever_hash['red'] = number[result.slice(/Red [0-9]/).slice(/[0-9]/)]
 lever_hash['green'] = number[result.slice(/Green [0-9]/).slice(/[0-9]/)]
 for lever,position in lever_hash
 loop { result = dothistimeout 'pull ' + lever + ' lever', 3, /^You pull/
 break if result =~ /#{position}/ }
 end
 move 'go step'
 move 'go passage'
 move 'go opening'