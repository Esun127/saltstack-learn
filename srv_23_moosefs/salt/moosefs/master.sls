include:
  - moosefs.common

install_master:
  pkg.installed:
    - pkgs:
      - moosefs-master
      - moosefs-cgiserv
      - moosefs-cgi
    - require:
      - pkg: mfs

mfsmaster:
  service.running:
    - name: moosefs-master
    - require:
      - cmd: mfsmaster

  cmd.run:
    - name: 'cp metadata.mfs.empty metadata.mfs'
    - cwd: /var/lib/mfs
    - user: root
    - group: root
    - unless: 'test -e metadata.mfs'
    - require:
      - file: /etc/mfs/mfsmaster.cfg


webserver-running:
  service.running:
    - name: moosefs-cgiserv
    - require:
      - pkg: install_master


/etc/mfs/mfsmaster.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsmaster.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - backup: '.bak'
    - require: 
      - pkg: install_master

/etc/mfs/mfsexports.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsexports.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - backup: '.bak'
    - require:
      - pkg: install_master


#/etc/mfs/mfsmetalogger.cfg:
#  file.managed:
#    - source: salt://moosefs/templates/mfsmetalogger.cfg
#    - templates: jinja
#    - user: root
#    - group: root
#    - mode: 0644
#    - backup: '.bak'
#    - require:
#      - pkg: mfs
