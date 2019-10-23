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

set_hostname:
  cmd.run:
    - name: "hostnamectl --static set-hostname {{pillar.hostname}}"
    - unless: hostname | grep 'bolod.xin'

update_dns:
  file.managed:
    - name: /etc/resolv.conf
    - source: salt://prepare/files/resolv.conf


push_hosts:
  file.managed:
    - name: /etc/hosts
    - source: salt://prepare/files/hosts

epel-release:
  pkg:
    - installed
  cmd.run:
    - name: yum clean all && yum makecache fast
    - unless: which salt-call
