result = Array.new
put "touch mural"
while line = get
	if line =~ /A black cat crosses o'er a path of blood|The crimson claw, the fang, the chase, the play|The mice will play until the hunger bites|There welcome lies, midst claws that spread with glee|Yet one may smile, and be a predator/
		result.push("Andelas")
	elsif line =~ /No mercy lies in sea's tempestuous rage|One ship is saved, one lost in tempest's din|Still waters gather, 'ware the eye of storms|The blood of tyrants feeds the hurricane|The sailor lives to praise the storm-wild sea/
		result.push("Charl")
	elsif line =~ /Cold stone be given life by fiery forge|Creation's soul, love's labor, earth and fire|Let hammer strike the stone, the stone create|The craftsman works, the iron becomes his hand|The forger draws hard beauty from the ore/
		result.push("Eonak")
	elsif line =~ /Cold yellow eye draws magic from a rune|Dark flame of knowledge burns the midnight lamp|The face of wisdom in the mirror crack'd|The old one, so 'tis said, is he who seeks|Thou feed'st the hearth of knowledge with a fire/
		result.push("Fash'lo'nae")
	elsif line =~ /In cold grey stone waits pale all-seeing eye|No mortal knows the veil beyond the gate|On silent wings, and peace beyond the dark|Silence is silver, grey eternity|The sickle falls and reaps the cycle's pause/
		result.push("Gosaena")
	elsif line =~ /Dance on the wild green, child of the wood|In autumn's chill the harvest golden reap'd|The healing herb, the oak, the barley grow|The silent doe reclines in dappled glade|To nature's sylvan bounty raise a toast/
		result.push("Imaera")
	elsif line =~ /Beauty belies corruption to the core|Behold temptation, bright deceiving lie|Fine silk and velvet drape the dark decay|The butterfly may twist into a wyrm|Ye soft and bitter, sharp and demon-sweet/
		result.push("Ivas")
	elsif line =~ /Carry the weight of ages before time|Death will yet come, still beauty lies in store|Preserve the beauty of the dark and light|Preserve the past for those who come anon|Seer of sad shadows, painter of Mystery|Sing prophecy of poets in the night|Speak into silence, silence answers back|The artist weeps, old tears becoming paint/
		result.push("Jastev")
	elsif line =~ /A snow-white feather dances on the air|A sylvan zephyr rides the winds of light|Above the green, white wings may soar afar|Fly on the mistral wind, bright bird of song|O love, bright spirit, rise on feathered wings/
		result.push("Jaston")
	elsif line =~ /A golden crown shines bright in moonlight grey|All wisdom at thy side, rule o'er the moon|Great mountain rises, crowned in sunlight gold|Keep alert watch unquieted by sleep|O King, keep watch from far beyond the ice|The bringer of tense peace to light and dark|The wisdom of the Law the balance keep|Thy word is law, great majesty of old/
		result.push("Koar")
	elsif line =~ /A pang of sorrow calls a long-lost love|Compassion doth within great sorrow lie|Return, O love, and mend a longing heart|The black rose grows among the purple graves|Young love reflected in a pool of tears/
		result.push("Laethe")
	elsif line =~ /Give all to life, that ye may death defy|Hold fast the golden key that binds the gate|In winter's cold doth life begin anew|The key, the gate, to be or not to be|The touch of death melts like the winter snow/
		result.push("Lorminstra")
	elsif line =~ /Death's minions scream and wail in twisted dark|Fear ye the serpent, mockery of death|In promises of life twists falsehood black|Serpent slithers among the fallen horde|Unending torment feeds on souls of lies/
		result.push("Luukos")
	elsif line =~ /A demon's wings beat time in shadow vile|Ancient destroyer, lord of what was not|Black shadow moves in timeless pit of ruin|Guard ye the veil, lest demons darkness free|Still-living ichor drips from blackened stone/
		result.push("Marlu")
	elsif line =~ /A dark blade's hiss disturbs the still night air|All life has price, and death does not come cheap|Cold death so swift, a whisper in the dark|O sudden darkness, death a silent strike|The white skull grins, the dark shape on the floor/
		result.push("Onar")
	elsif line =~ /I shroud my prayers in darkest cloak of night|In dreams may darkness find a peaceful sleep|O silver blade, flash brightly in the night|Protector of the night, keep safe the dark|Walk brave in endless shadow, guard the door|Watch o'er the night, so we might keep the day/
		result.push("Ronan")
	elsif line =~ /A nightmare drips black blood upon the stone|Behold dark dreams of nightmare gallery|False gold in dreams of blackness, crimson blood|In moon-dark shadows howls the jackal wild|Stark scream of terror pleads for break of day/
		result.push("Sheru")
	elsif line =~ /A breath of life, a trinket to a thief|Across the sky, a streak of flaming gold|Be swift of foot and mind, and quickly fly|On golden wings, a blur of wind and haste|On wings begat of freedom prayers take flight|The hand so quick, the surest eye is lost/
		result.push("Tonis")
	elsif line =~ /A golden rose lies soft on sanguine field|A king mayst not deny love pure and true|Hold fast thy hands, and love shall find its way|The love forbidden, fate shall not deny|Young love is golden to the true of heart/
		result.push("Voaris")
	elsif line =~ /A pixie's laugh, a dark demented soul|A silver crescent flickers in thine eye|Beyond the moons, mad laughter calls to thee|The gift of madness touches whom it may|Wild freedom lies beneath chaotic moon/
		result.push ("Zelia")
	elsif line =~ /The face falls quiet and goes still./
		break
	end
end

result.each{ |deity|
	if Char.name == "Drafix"
		put "touch #{deity}"
	else
		fput "touch #{deity}"
	end
}