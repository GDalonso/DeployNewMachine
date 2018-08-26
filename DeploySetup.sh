sudo apt-get update
sudo apt-get install git
echo Digite seu email
read varemail
echo Digite seu username
read varusername
#generate ssh key for github
ssh-keygen -t rsa -b 4096 -C "$varemail"
eval "$(ssh-agent -s)"
echo key start
echo
cat /home/$USER/.ssh/id_rsa.pub
echo Copy and add the ssh key to your github and gitlab
echo
echo https://github.com/settings/keys
echo https://gitlab.com/profile/keys
echo ========================================
echo
echo Installing Pycharm community edition
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make
sudo umake ide pycharm
echo ========================================
echo
echo Installing Visutal Studio Code
sudo umake ide visual-studio-code
echo ========================================
echo
echo Installing Atom
sudo umake ide atom
echo ========================================
echo
echo YOU MAY NEED TO CHANGE THE SHORTCUTS PATH FROM EDITORS INSTALLED WITH UMAKE TO THE ONES YOU INSTALLED THE APPLICATION
echo THE DEAFAULT IS /home/gui/.local/share/umake/ide/ID_NAME
echo 
echo ========================================
echo Installing Google Chrome
sudo apt install chromium-browser


