zabbix-agent:
  pkg.installed:
    - name: zabbix30-agent

  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      Server: {{ pillar['zabbix-agent']['zabbix_server']}}
    - require:
      - pkg: zabbix-agent

  service.running:
    - enable: True
    - watch:
      - pkg: zabbix-agent
      - file: zabbix-agent
   
zabbix_agentd.conf.d:
  file.directory:
    - name: /etc/zabbix_agentd.conf.d
    - watch_in:
      - service: zabbix-agent
    - require:
      - pkg: zabbix-agent
      - file: zabbix-agent

