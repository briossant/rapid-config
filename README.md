# VITE MON VIM

## Install

### general

clone this repository then

delete your old ```.vimrc```, ```coc-config.json``` and ```.clang-format```:
```
rm -f ~/.vimrc ~/.vim/coc-settings.json ~/.clang-format
```

build the config with
```
nix run rapid-config#homeConfigurations.vim.activationPackage
```

#### on the PIE

/!\ you need to clone the repository in your afs /!\

on the pie your config is reset each time you login

you will need to add the build command in your ```~/afs/.confs/install.sh```

don't forget to update the path, for example if you clone at the root of the
afs:

```
nix run ~/afs/rapid-config#homeConfigurations.vim.activationPackage
```


