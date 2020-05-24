# cartograph

The current goals of this proejct are as follows:

- [X] create a git history for the MapDB
- [X] ability to import directly from the `;repository`
- [X] untangle `StringProc` from the node (Room) definitions
- [ ] provide tools for working directly with the mapDB
- [ ] some sort of bot that pulls and merges changes from the MapDB (this is difficult)
- [ ] create a `;go2` utility that uses the tarball from this repository

### Workflow

Currently there is only one task.
```
tasks/sync
```

Here is exactly what each step does, the above examples require a `Bash` shell:

1. downloads the map db if the checksum does not match the current checksum in the repo
2. deletes maps and rebuilts it in a diff-able manner using the latest MapDB
3. copies the new checksum into the root of repository
4. if there are now pending changes for the JSON Rooms they are committed
5. if there are now pending changes for the StringProc files they are committed