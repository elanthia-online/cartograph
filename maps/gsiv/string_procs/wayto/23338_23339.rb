status_tags
put "get my heavy key"
while line = get
	if line =~ /^You remove .+heavy iron key<\/a> from in your <a exist="(.+)"/
		container = $1
		break
	elsif line =~ /^Get what\?$/
		container = nil
		break
	end
end
status_tags
if container
	fput "unlock spiked gate with my heavy key"
	fput "put my heavy key in ##{container}"
	move "go spiked gate"
else
	echo "** You do not have the key! **"
	echo "You will have to do the puzzle on the table!"
	exit
end