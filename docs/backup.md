# bash-util-scripts

[Back to index](../README.md).

## backup.sh

Backup file ("tar.gz") generator from specified source directories, work directories and files are excluded.
```
$ backup.sh source_dir1 [source_dir2 ...]
```

* Note: Exclude .DS_Store, .git/, node_modules/, build/, cache/, *.bak, *.swp