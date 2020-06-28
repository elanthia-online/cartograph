table = "cozy"
 response = dothistimeout("go #{table} table", 25, /You (?:and your group )?head over to|inviting you to join|invites you/)
 if response =~ /inviting|invites you/ then fput "go #{table} table" end