begin
 fput 'search'
 search_result = waitfor "don't find anything", "discover", "Roundtim", "Round time"
 waitrt?
 end until search_result =~ /discover/
 move 'go opening'