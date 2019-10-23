include:
  - moosefs.common


metalogger-install:
  pkg.installed:
    - name: moosefs-metalogger
    - require:
      - pkg: mfs


mfsmetalogger:
  service.running:
    - name: moosefs-metalogger
    - require:
      - file: /etc/mfs/mfsmetalogger.cfg


/etc/mfs/mfsmetalogger.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsmetalogger.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - backup: 'bak'
    - require:
      - pkg: metalogger-install

