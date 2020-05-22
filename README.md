# cartograph

This is the current workflow, which will likely be combined into a single command

```
tasks/sync
```

Here is exactly what each step does, the above examples require a `Bash` shell:

1. downloads the map db if the checksum does not match the current checksum in the repo
2. deletes maps and rebuilts it in a diff-able manner using the latest MapDB
3. copies the new checksum into the repository