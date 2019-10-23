change-hostname:
  cmd.run:
    - name: "hostnamectl --static set-hostname {{pillar.hostname}}"
    - unless: hostname | grep 'bolod.xin'
push-hosts:
  file.managed:
    - name: /tmp/hosts
    - source: salt://hosts
    - template: jinja
    - context:
      hosts: {{salt['cmd.run']('hostname')}}
