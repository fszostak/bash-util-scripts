# bash-util-scripts


## backup

Generate tar.gz backup file, exclude from file work directories and files.
```
$ backup source_dir1 [source_dir2 ...]
```

* Note: Exclude .DS_Store, .git/, node_modules/, build/, cache/, *.bak, *.swp

## optimize

Optimize for Web images JPG and PNG in the source directory

```
$ optimize source_dir
```

* Note: need install jpegoptim and pngquant
