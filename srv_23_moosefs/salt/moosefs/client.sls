include:
  - moosefs.common

mfs-client:
  pkg.installed:
    - name: moosefs-client
    - require:
      - pkg: mfs
  cmd.run:
    - name: mfsmount {{pillar['moosefs']['mfsmount']}} -H {{pillar['moosefs']['master']}}
    - cwd: /
    - user: root
    - group: root
    - unless: df -h | grep {{pillar['moosefs']['mfsmount']}}
    - require:
      - file: {{pillar['moosefs']['mfsmount']}}

{{pillar['moosefs']['mfsmount']}}:
  file.directory:
    - user: daemon
    - group: daemon
    - mode: 755
    - makedirs: True
    - require:
      - pkg: mfs-client
