shutdown_firewalld:
  service.dead:
    - name: firewalld
    - enable: False

shutdown_postfix:
  service.dead:
    - name: postfix
    - enable: False

setoff_selinux:
  cmd.run:
    - name: setenforce 0
    - unless: getenforce | grep Perm

disable_selinux:
  file.replace:
    - pattern: '^SELINUX=.*'
    - repl: SELINUX=disabled
    - name: /etc/selinux/config
