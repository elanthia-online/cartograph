open_regex = /^You open|^That is already open\.$|^There doesn't seem to be any way to do that\.$|^What were you referring to\?|^I could not find what you were referring to\./

if UserVars.mapdb_use_day_pass =~ /^yes$/i
   $mapdb_day_passes ||= Hash.new
   unless DownstreamHook.list.include?('mapdb_day_pass_monitor')
      last_id = nil
      month_num = { 'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'Jun' => 6, 'Jul' => 7, 'Aug' => 8, 'Sep' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12 }
      hook_proc = proc { |s|
         if s =~ /^Bold calligraphy states simply, "This <a exist="(-?[0-9]+)" noun="pass">pass<\/a> entitles the original purchaser to one \(1\) day of unlimited travel between the towns of (.+?) and (.+?), commencing/
            last_id = $1
            $mapdb_day_passes[last_id] = { :towns => [$2,$3] }
         elsif s =~ /^Bold red block letters spelling out "EXPIRED" appear to have been stamped across the face and reverse of the <a exist="(-?\d+)" noun="pass">pass/
            $mapdb_day_passes[$1] = { :towns => [], :expires => Time.now }
         elsif s =~ /^\[Your pass will expire on \w+ (\w+) (\d+) (\d+):(\d+):(\d+) ET (\d+)\./
            if last_id
               $mapdb_day_passes[last_id][:expires] = Time.at(Time.new($6, month_num[$1], $2, $3, $4, $5, "-05:00").to_i)
               last_id = nil
            end
         elsif s =~ /quickly hands you a Chronomage day pass/ # fixme: xml
            UserVars.mapdb_find_day_pass = 'yes'
         end
         s
      }
      DownstreamHook.add('mapdb_day_pass_monitor', hook_proc)
      UserVars.mapdb_find_day_pass = 'yes'
   end

   if (UserVars.mapdb_find_day_pass == 'yes') and (bounty? !~ /^You have made contact with the child/) and ((bounty? !~ /provide a protective escort/) or (bounty? =~ /WAIT/))
      if (sack_name = UserVars.day_pass_sack)
         sack = (
            GameObj.inv.find { |obj| obj.noun == sack_name} ||
            GameObj.inv.find { |obj| obj.name == sack_name } ||
            GameObj.inv.find { |obj| obj.name =~ /\b#{Regexp.escape(sack_name)}$/i } ||
            GameObj.inv.find { |obj| obj.name =~ /\b#{sack_name.split(' ').collect { |n| Regexp.escape(n) }.join(".*\\b")}/i }
         )
         if sack
            close_sack = false
            if sack.contents.nil?
               open_result = dothistimeout "open ##{sack.id}", 10, open_regex
               if open_result =~ /^You open/
                  close_sack = true
               else
                  dothistimeout "look in ##{sack.id}", 10, /In the .*? you see/
               end
            end
            if sack.contents
               $mapdb_day_passes.keys.each { |id|
                  unless sack.contents.any? { |obj| obj.id == id }
                     $mapdb_day_passes.delete(id)
                  end
               }
               sack.contents.find_all { |obj| obj.name == 'Chronomage day pass' }.each { |pass|
                  next if $mapdb_day_passes[pass.id]
                  dothistimeout "look ##{pass.id}", 10, /^Bold calligraphy states simply|^Bold red block letters spelling out "EXPIRED"|^I could not find/
               }
               UserVars.mapdb_find_day_pass = 'no'
            else
               if $mapdb_last_day_pass_message.nil? or ((Time.now - $mapdb_last_day_pass_message) > 5)
                  $mapdb_last_day_pass_message = Time.now
                  echo "Failed to find contents of day_pass_sack: #{sack_name}; go2 will not use Chronomage day pass travel."
               end
            end
            if close_sack
               dothistimeout "close ##{sack.id}", 3, /^You close/
            end
         else
            if $mapdb_last_day_pass_message.nil? or ((Time.now - $mapdb_last_day_pass_message) > 5)
               $mapdb_last_day_pass_message = Time.now
               echo "warning: Failed to find day_pass_sack: #{sack_name}; go2 will not use Chronomage day pass travel."
            end
         end
      else
         if $mapdb_last_day_pass_message.nil? or ((Time.now - $mapdb_last_day_pass_message) > 5)
            $mapdb_last_day_pass_message = Time.now
            echo "warning: day_pass_sack is not set; go2 will not use Chronomage day pass travel."
            echo "Specify the location of your Chronomage day passes with #{$clean_lich_char}vars set day_pass_sack=CONTAINER"
         end
      end
   end
   if $mapdb_day_passes.any? { |id,h| h[:towns].include?("Wehnimer's Landing") and h[:towns].include?('Solhaven') and h[:expires] > (Time.now + 10) }
      0.8
   elsif UserVars.mapdb_buy_day_pass =~ /^yes$|\bwl,sol\b/i
      4.4
   else
      nil
   end
else
   nil
end

