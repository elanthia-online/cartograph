10.times { result = dothistimeout 'search', 5, /don't find anything|discover a small footpath|Round ?time/
 waitrt?
 break if result =~ /discover a small footpath/ }
 move 'go footpath'