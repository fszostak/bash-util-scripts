# bash-util-scripts


## backup

Backup file ("tar.gz") generator from specified source directories, work directories and files are excluded.
```
$ backup source_dir1 [source_dir2 ...]
```

* Note: Exclude .DS_Store, .git/, node_modules/, build/, cache/, *.bak, *.swp

## optimize

Automated script for recursively web image files optimization.

```
$ optimize source_dir
```

* Note: need install jpegoptim and pngquant
