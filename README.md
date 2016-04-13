To deploy ansible config from github to ansible-control.bornhack.org:
  sudo /root/deploy.sh

Before running ansible:
  sudo su ansible

Deploy specific github branch to specific staging server:

    ansible-playbook --vault-password-file /root/.ansiblevaultpass --tags "codedeploy" -i /usr/local/etc/ansible/staging_hosts -l "wwwstaging.bornhack.org" --extra-vars "github_branch=feature/new-design-and-content" /usr/local/etc/ansible/django_servers.yml
---
Deploy master github branch to production bornhack.dk webserver:

    ansible-playbook --vault-password-file /root/.ansiblevaultpass --tags "codedeploy" -i /usr/local/etc/ansible/production_hosts -i "www.bornhack.org" /usr/local/etc/ansible/django_servers.yml
---
Reconfigure everything on all staging tor servers:

    ansible-playbook --vault-password-file /root/.ansiblevaultpass -i /usr/local/etc/ansible/staging_hosts /usr/local/etc/ansible/tor_servers.yml
---
Reconfigure everything on all production servers:

    ansible-playbook --vault-password-file /root/.ansiblevaultpass -i /usr/local/etc/ansible/production_hosts /usr/local/etc/ansible/site.yml
---
