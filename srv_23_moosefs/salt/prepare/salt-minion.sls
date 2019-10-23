salt-minion:
  pkg:
    - installed
    - require:
      - pkg: epel-release
      - cmd: epel-release
  service:
    - running
    - enable: True
    - require:
      - pkg: salt-minion
    - watch:
      - file: salt-minion-config

#salt-minion-config-master:
#  file:
#    - replace:
#    - pattern: '^#master:.*'
#    - repl: 'master: node1'
#    - require:
#      - file: push_hosts
#      - pkg: salt-minion
#
#salt-minion-config-id:
#  file:
#    - replace:
#    - pattern: '^#id:.*'
#    - repl: id: {{salt['cmd.run']("hostname | sed 's/.bolod.xin//g'")}}
#    - require:
#      - cmd: set_hostname
#      - file: push_hosts
#      - pkg: salt-minion

salt-minion-config:
  file.append:
    - name: /etc/salt/minion
    - text: |
        master: node1
        id: {{salt['cmd.run']("sed 's#.bolod.xin##g' /etc/hostname")}}
    - require:
      - cmd: set_hostname
      - file: push_hosts
      - pkg: salt-minion
