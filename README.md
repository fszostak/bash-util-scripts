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

* Requirements: install jpegoptim and pngquant

On MacOS:

Install brew: 
```
sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install jpegoptim and pngquant: 
```
brew install jpegoptim pngquant
```
 
Add scripts to your PATH: 
```
echo "export PATH=$PATH:~/bash-util-scripts/src" >> ~/.bash_profile
```
