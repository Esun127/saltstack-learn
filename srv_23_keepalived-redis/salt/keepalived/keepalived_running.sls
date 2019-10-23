keepalived_running:
  service.running:
    - name: keepalived
    - enable: True
    - require:
      - pkg: install_keepalived
    - watch:
      - file: keepalived_conf

