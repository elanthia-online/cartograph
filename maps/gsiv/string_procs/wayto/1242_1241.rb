begin
 fput 'search'
 search_result = waitfor "discover a", "don't find anything", "Roundtime", "Round time"
 waitrt?
 end until search_result =~ /discover a/
 move 'go path'