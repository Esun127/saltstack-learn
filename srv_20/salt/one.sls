---
#/tmp/foo.conf:
#  file.managed:
#    - source: salt://foo.conf
#    - user: root
#    - group: root
#    - mode: 0644
#    - backup: minion


install packages:
  pkg.installed:
    - pkgs:
        - python2-pip
        - python2-redis



