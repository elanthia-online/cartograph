table = "skinny"; fput "go #{table} table" if dothistimeout("go #{table} table", 25, /You (?:and your group )?head over to|waves.*you.*(?:invites|inviting) you(?: and your group)? to (?:join|come sit at)/) =~ /inviting you|invites you/