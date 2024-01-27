# export USER=...
# export PASSWORD=...

export PASSWORD=`mkpasswd -m sha-512 -s $PASSWORD` && \
useradd -m -p $PASSWORD -g sudo -s /bin/bash $USER && \
cp -R ~/.ssh /root/.ssh && \
cp ~/{.bash_aliases,.bash_logout,.bash_profile,.nanorc,.tmux.conf} /root/ && \
chown -R $USER:sudo /root && \
echo -e "\n\e[31mFINISHED :)\e[0m"
