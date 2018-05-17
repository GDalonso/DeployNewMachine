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
