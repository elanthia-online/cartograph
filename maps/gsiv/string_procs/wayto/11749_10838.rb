while line = get
if line=~ /The crew hurriedly puts out the gangplank\.|River's Rest\.\.\..+ ashore!/
fput "out"
break
end
end