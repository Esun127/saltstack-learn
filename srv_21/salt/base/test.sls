/tmp/hosts.txt:
  file.managed:
    - source: salt://hosts.j2
    - template: jinja
    - context:
      groups: {{pillar['master']['nodegroups']}}


