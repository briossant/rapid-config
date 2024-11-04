# VITE MON VIM

#### READ EVERYTHING IF YOU WANT IT TO WORK

Add autocompletion, error checking, auto formatting and a lot more to your vim
config.

## Configuration

### Necessary

Add your username in ```flake.nix```, you can also choose the darkmode in there.

### Extra

You can alse add extra packages in ```home.nix```.

The vimrc can be change in ```vim/vimrc``` and in ```vim/default.nix```.

## Installation

### General

Delete your old ```.vimrc```, ```coc-config.json``` and ```.clang-format```:
```
rm -f ~/.vimrc ~/.vim/coc-settings.json ~/.clang-format
```

Build the config with
```
nix run .#homeConfigurations.vim.activationPackage
```

#### On the PIE

/!\ you need to clone the repository in your afs /!\

On the pie your config is reset each time you login,
you will need to add the build command in the ```~/afs/.confs/install.sh```
script.

Don't forget to update the path, for example if you cloned at the root of the
afs:

```
nix run ~/afs/rapid-config#homeConfigurations.vim.activationPackage
```


