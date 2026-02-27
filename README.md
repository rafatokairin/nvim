# Build env:

## install nvim:
```
sudo add-apt-repository ppa:neovim-ppa/unstable
```

```
sudo apt install neovim
```

git clone into: ~/.config/

## basic cfg git:

```
ssh-keygen -t ed25519 -C "seu_email@example.com"
```

generate ssh key:

```
cat ~/.ssh/id_ed25519.pub
```

paste on ssh in git.

## install zsh:

```
sudo apt install zsh
```

turn default zsh:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

to install plugins, you must edit the ~/.zshrc file. Look for the plugins item (by default it's on line 73):

```
plugins=(copyfile copypath git sudo ubuntu z zsh-autosuggestions zsh-syntax-highlighting)
```

change theme:

```
ZSH_THEME="agnoster"
```

## install nerdfonts:

```
# 1. create dir
mkdir -p ~/.local/share/fonts

# 2. install unzip
sudo apt install unzip -y

# 3. install JetBrainsMono
curl -fLo ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

# 4. unzip
unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

# 5. att cache
fc-cache -fv
```

## install ripgrep:

```
sudo apt install ripgrep
```

## install gcc:

```
sudo apt update

sudo apt install build-essential
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
