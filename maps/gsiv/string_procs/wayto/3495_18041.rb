fput 'speak'
 language = /You are currently speaking (.*?)\./.match(get).captures.first until language

 fput('speak wizard') unless language == 'Guildspeak'
 fput('unhide') if hidden? or invisible?
 move 'say ::door wizard'
 fput('speak ' + language.to_s) unless language == 'Guildspeak'