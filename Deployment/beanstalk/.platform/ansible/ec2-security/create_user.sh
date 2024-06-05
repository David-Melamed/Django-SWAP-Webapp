---
- name: Configure EC2 instances
  hosts: all
  become: yes
  tasks:
    - name: Create a new user
      user:
        name: devops_user
        shell: /bin/bash
        create_home: yes

    - name: Add user to sudoers
      lineinfile:
        path: /etc/sudoers
        state: present
        line: 'devops_user ALL=(ALL) NOPASSWD:ALL'

  handlers:
    - name: Restart SSH
      service:
        name: ssh
        state: restarted
