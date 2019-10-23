pptpd:
  pkg:
    - installed

  service.running:
    - enable: True
    - watch:
      - file: pptpd
      - file: pptpd-secrets
      - file: pptpd-options

  file.managed:
    - name: /etc/pptpd.conf
    - source: salt://files/pptpd.conf
    - template: jinja
    - require:
      - pkg: pptpd

pptpd-secrets:
  file.managed:
    - name: /etc/ppp/chap-secrets
    - mode: 600
    - source: salt://files/chap-secrets
    - template: jinja

pptpd-options:
  file.managed:
    - name: /etc/ppp/pptpd-options
    - source: salt://files/options
    - template: jinja
