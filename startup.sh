echo 'updating...'
sudo apt-get update

######## terminal ########

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"gildo\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"gildo@gildo.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo 'installing terminator'
sudo apt-get update
sudo apt-get install terminator -y

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing theme'
sudo apt install fonts-firacode -y
sudo apt install fonts-powerline
sh -c "$ (curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh )"
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="agnoster"/g' ~/.zshrc

echo 'installing htop'
sudo apt install htop

######## coding ########

echo 'installing vim'
sudo apt install vim -y
clear

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension ms-vscode.cpptools
code --install-extension vscjava.vscode-java-debug
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-python.python
code --install-extension ms-vsliveshare.vsliveshare-audio

echo 'installing java'
sudo apt-get update
sudo apt install default-jre
java -version
export JAVA_HOME=/usr/java/jre11.0.7
export PATH=${PATH}:${JAVA_HOME}/bin

echo 'installing eclipse'
sudo snap install --classic eclipse

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing insomnia'
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install insomnia

######## browsers ########

echo 'installing brave'
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

######## communication ########

echo 'installing slack' 
sudo snap install slack

echo 'installing discord'
sudo snap install discord

echo 'installing telegram'
sudo add-apt-repository ppa:atareao/telegram
sudo apt update && sudo apt install telegram

echo 'installing zoom'
wget -O Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt update
sudo apt install ~/Downloads/zoom.deb

######## media players/editors ########

echo 'installing glimpse'
sudo apt-get update -y
sudo apt-get install -y glimpse

echo 'installing vlc'
sudo snap install vlc

echo 'installing spotify' 
snap install spotify

######## ubuntu extensions ########

echo 'installing gnome-tweaks'
sudo apt install gnome-tweaks

echo 'installing shell extensions'
sudo apt install gnome-shell-extensions

echo 'installing weather extension'
sudo apt install gnome-shell-extension-weather
echo 'press ALT+F2, then r to restart the shell'


echo 'updating...'
sudo apt-get update

echo 'upgrading...'
sudo apt-get upgrade
