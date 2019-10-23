include:
  - moosefs.common


msfchunkserver:
  service.running:
    - name: moosefs-chunkserver
    - require:
      - file: /etc/mfs/mfschunkserver.cfg


/etc/mfs/mfschunkserver.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfschunkserver.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - backup: '.bak'
    - require:
      - pkg: mfs

/etc/mfs/mfshdd.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfshdd.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - backup: '.bak'
    - require:
      - pkg: mfs

{% for mfschunks in pillar['moosefs']['mfshdd'].split() %}
{{mfschunks}}:
  file.directory:
    - user: daemon
    - group: daemon
    - mode: 755
    - makedirs: True
{% endfor %}

