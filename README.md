To deploy ansible config from github on ansible3.servers.bornhack.org:
  sudo /root/deploy.sh

Before running ansible:
  sudo su ansible

Deploy specific github branch to specific django server:

    cd /usr/local/etc/ansible && ansible-playbook --tags "codedeploy" -l "django4.servers.bornhack.org" --extra-vars "django_github_branch=feature/new-design-and-content" roles/playbook.yml
---
Deploy default github branch and update virtualenv:

    cd /usr/local/etc/ansible && ansible-playbook --tags "codedeploy,pip" -l "django5.servers.bornhack.org" roles/playbook.yml
---
Reconfigure everything on all servers:

    cd /usr/local/etc/ansible && ansible-playbook roles/playbook.yml
---
