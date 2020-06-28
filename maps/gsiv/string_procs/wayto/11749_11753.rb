while line = get
if line=~ /The crew hurriedly puts out the gangplank\.|Solhaven\.\.\..+ ashore!/
fput "out"
break
end
end