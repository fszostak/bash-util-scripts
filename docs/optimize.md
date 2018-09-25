# bash-util-scripts

[Back to index](../README.md).

## optimize.sh

Automated script for recursively web image files optimization.

```
$ optimize.sh source_dir
```

### Requirements
Install jpegoptim and pngquant

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

Source: [optimize.sh](https://github.com/fszostak/bash-util-scripts/blob/master/src/optimize.sh)
