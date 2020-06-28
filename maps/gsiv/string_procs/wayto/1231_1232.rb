begin
 fput 'search'
 search_result = waitfor "don't find anything", "discover a narrow opening", "Roundtime", "Round time"
 waitrt?
 end until search_result =~ /discover a narrow opening/
 move 'go opening'