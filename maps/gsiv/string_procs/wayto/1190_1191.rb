if checknpcs.include?('ferryman')
 fput 'unhide' if invisible? or hidden?
 result = dothis 'give ferryman 10', /What is it you're trying to give|Thank you, friend\.  Go ahead and board\.|Sorry, friend, break time for me\.  Not taking tolls\./
 else
 result = nil
 end
 until result =~ /Thank you, friend\.  Go ahead and board\./
 echo 'Waiting for the ferryman...'
 nil until get =~ /nimbly walks up the gangplank|He sets the gangplank down between the dock and the ferry and takes his place next to it\.|The ferryboat bumps up against the dock.  Immediately the ferryman ropes the boat securely to the dock, then picks up the gangplank and lays it down between the ferry and the dock, providing a safe, firm exit\./
 fput 'unhide' if invisible? or hidden?
 result = dothis 'give ferryman 10', /What is it you're trying to give|Thank you, friend\.  Go ahead and board\.|Sorry, friend, break time for me\.  Not taking tolls\./
 end
 move 'go gang'