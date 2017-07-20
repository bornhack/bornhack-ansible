To deploy ansible config from github to ansible-control.bornhack.org:
  sudo /root/deploy.sh

Before running ansible:
  sudo su ansible

Deploy specific github branch to specific staging server:

    ansible-playbook --tags "codedeploy" -i /usr/local/etc/ansible/staging_hosts -l "staging2.servers.bornhack.org" --extra-vars "django_github_branch=feature/new-design-and-content" /usr/local/etc/ansible/roles/playbook.yml
---
Deploy master github branch to production bornhack.dk webserver:

    ansible-playbook --tags "codedeploy" -i /usr/local/etc/ansible/production_hosts -l "www.bornhack.dk" /usr/local/etc/ansible/roles/playbook.yml
---
Reconfigure everything on all staging tor servers:

    ansible-playbook --tags "tor_servers" -i /usr/local/etc/ansible/staging_hosts /usr/local/etc/ansible/roles/playbook.yml
---
Reconfigure everything on all production servers:

    ansible-playbook -i /usr/local/etc/ansible/production_hosts /usr/local/etc/ansible/roles/playbook.yml
---

