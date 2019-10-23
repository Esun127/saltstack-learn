keepalived_conf:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/templates/keepalived.conf.j2
    - user: root
    - group: root
    - template: jinja
    - mode: 0644
    - require:
      - pkg: install_keepalived
      - cmd: scripts_dir

scripts_dir:
  cmd.run:
    - name: mkdir -p /etc/keepalived/scripts
    - unless: test -d /etc/keepalived/scripts

{% for s in ["redis_backup.sh", "redis_check.sh", "redis_fault.sh", "redis_master.sh", "redis_stop.sh"] %}
keepalived_{{s}}:
  file.managed:
    - name: /etc/keepalived/scripts/{{s}}
    - source: salt://keepalived/templates/scripts/{{s}}
    - user: root
    - group: root
    - mode: 0755
    - template: jinja
    - require:
      - file: keepalived_conf
{% endfor %}
