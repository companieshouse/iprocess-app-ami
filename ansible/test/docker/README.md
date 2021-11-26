# RHEL8 Base AMI testing

A simple docker setup to cover testing of Ansible.

To test, first ensure you have all required dependancies installed: 
```
ansible-galaxy install -r requirements.yml
ansible-galaxy install -r ../requirements.yml
```

Then we can execute the playbook. This will create a docker container based on Centos8 and execute the playbook.
```
ansible-playbook playbook.yml --extra-vars @../host_vars/rhel8-base.yml --skip-tags rule_4.3
```