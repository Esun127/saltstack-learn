---
redis:
  pkg.installed


update redis config file 1:
  file.replace:
    - name: /etc/redis.conf
    - pattern: '^bind\s127.0.0.1$'
    - repl: 'bind 0.0.0.0'

update redis config file 2:
  file.replace:
    - name: /etc/redis.conf
    - pattern: '^protected-mode\syes$'
    - repl: 'protected-mode no'
    - watch_in:
      - redis: start redis service


start redis service:
  service.running:
    - name: redis
    - reload: True
