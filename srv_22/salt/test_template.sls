template-test:
  file.managed:
    - source: salt://test.j2
    - name: /tmp/test.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
