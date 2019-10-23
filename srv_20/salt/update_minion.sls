---
add redis as return storage:
  file.append:
    - name: /etc/salt/minion
    - text: |
        redis.db: '0'
        redis.host: '192.168.1.103'
        redis.port: 6379
