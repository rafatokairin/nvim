## install NerdFonts JetBrains

## install ripgrep:

```
sudo apt install ripgrep
```

## install gcc:

```
sudo apt update

sudo apt install build-essential
```

## cfg ssh git:

```
ssh-keygen -t ed25519 -C "seu-email@example.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub
```

## link nvim:

```
sudo ln -s /opt/nvim/nvim /usr/local/bin/nvim
```

## install pynvim:

```
sudo apt install unzip

sudo apt install python3-pynvim -y
```

## cfg right button mousepad:

```
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
```

## cfg cedilla:

```
nvim ~/.XCompose

include "%L"
<dead_acute> <c> : "ç" U00E7
<dead_acute> <C> : "Ç" U00C7
```

## coderoot:

```
echo "alias coderoot='sudo -E code --user-data-dir=/tmp/vscode-root --no-sandbox'" >> ~/.bashrc

source ~/.bashrc
```
