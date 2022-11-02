#Git
#shows the name of the branch on the terminal
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

current_git_branch_name(){
    parse_git_branch | sed 's/(//;s/)//'
}

#List the branches you've been working on recently
recentbranches()
{
    git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'
}

gs(){
    git status
}
gp (){
    git pull
}

gpb(){
    git pull origin $(current_git_branch_name)
}

gpm(){
    git pull origin main || git pull origin master
}

gcm(){
    git checkout main || git checkout master
}

gpush(){
    git push origin $(current_git_branch_name)
}

gpull(){
    git pull origin $(current_git_branch_name)
}

gcb(){

    if [ $1 ]; then
        echo $1
        git checkout -b $1
    else
        echo "type the branch name"
        read BRANCHNAME
        echo $BRANCHNAME
        git checkout -b $BRANCHNAME
    fi
}

gad(){
    git add .
}

gap(){
    git add -p
}

gcmessage(){
    if [ "$@" ]; then
        echo "$@"
        git commit -m "$@"
    else
        read -p "type the commit message: " MESSAGE
        echo $MESSAGE
        git commit -m $MESSAGE
    fi
}

gcd(){
    git commit -m .
}

gitsquash(){
    if [ "$@" ]; then
        git reset $(git merge-base "$@" $(git branch --show-current))
        git add -A
    else
        echo "inform the main branch name: usage gitsquash master or gitsquash dev"
    fi
}

####################################################################################
#Docker

dockerkill(){
    #Kill all containers
	docker kill $(docker ps -q)
}

dockerstop(){
    #Gracefully shutdown all containers
	docker stop $(docker ps -q)
}

dockerclean(){
    #Remove all containers
    docker rm -f $(docker ps -a -q)
}

dockerimageprune(){
    #Remove all local docker images
    docker image prune -a
}

dockerprune(){
    docker system prune --all

}

dockervolumels(){
    docker volume ls
}

dockervolumerm(){
    docker volume rm $(docker volume ls -q)
}

####################################################################################
#Kafka local
cdkafka(){
    cd /home/$(USER)/kafka_2.13-3.1.0
}
runzookeeper(){
    cdkafka
    bin/zookeeper-server-start.sh config/zookeeper.properties
}
runkafka(){
    cdkafka
    kafka-server-start.sh config/server.properties
}

####################################################################################
#AWS
showaws(){
    #Show local credentials
    cat ~/.aws/credentials
}

removeoldcreds(){
    rm $HOME/.docker/config.json
}

####################################################################################
#Pre commit
pi(){
    pre-commit install
}

precommitrunall(){
    pre-commit run --all-files
}

####################################################################################
#Bash
bashsource(){
    source ~/.bashrc
}

bashhistory(){
    cat ~/.bash_history
}

bashhistorygrep(){
    if [ $1 ]; then
        cat ~/.bash_history | grep $1
    else
        echo "Type your filter"
        read FILTER
        cat ~/.bash_history | grep $FILTER
    fi

}

#SMB
smbconfig(){
    sudo nano /etc/samba/smb.conf
}
smbrestart(){
    sudo service smbd restart
}