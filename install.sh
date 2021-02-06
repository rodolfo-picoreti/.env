
sudo apt update

sudo apt install -y \
  wget \
  vim \
  curl \
  git \
  unzip \
  apt-transport-https 

#### git

git config --global user.email "rodolfo.picoreti@gmail.com"
git config --global user.name "Rodolfo Picoreti"

#### chrome

if ! command -v google-chrome &> /dev/null
then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
else
  echo chrome already installed
fi

#### code

if ! command -v code &> /dev/null
then
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt install code -y 
else
  echo vscode already installed
fi

#### sdkman

if ! command -v sdk &> /dev/null
then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
else 
  echo sdkman already installed
fi

sdk_packages=(
  "gradle"
  "maven"
  "visualvm"
  "java 15.0.1-zulu"
)

for package in "${sdk_packages[@]}"; do
  sdk install $package
done

## dbeaver

if ! command -v dbeaver &> /dev/null
then
  wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
  sudo dpkg -i dbeaver-ce_latest_amd64.deb
else
  echo dbeaver already installed
fi

## ripgrep

if ! command -v rg &> /dev/null
then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
  sudo dpkg -i ripgrep_12.1.1_amd64.deb
else
  echo ripgrep already installed
fi
