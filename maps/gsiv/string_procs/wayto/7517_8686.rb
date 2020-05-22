begin
clear
fput 'climb ladder'
climb_result = waitfor "As you try to climb the ladder, a rung breaks under your weight", "You carefully make your way up the dilapidated ladder."
fput 'stand' unless climb_result == "You carefully make your way up the dilapidated ladder."
end until climb_result == "You carefully make your way up the dilapidated ladder."