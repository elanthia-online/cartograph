move 'go gangplank'
if Room.current.id == 10117
echo 'Waiting for ferry... '
waitfor 'An elven crewmember scrambles back onto the boat and lowers the gangplank.'
move 'go gangplank'
end
waitfor 'An elven crewmember scrambles back onto the boat and lowers the gangplank.'
move 'out'