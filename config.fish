set -x PATH $PATH /sbin /home/whyrusleeping/go/bin ~/gopkg/bin ~/bin
set -x GOPATH /home/whyrusleeping/gopkg

set -x EDITOR vim

echo $SSH_AGENT_PID > $HOME/.ssh_agent_pid
echo $SSH_AUTH_SOCK > $HOME/.ssh_auth_sock
