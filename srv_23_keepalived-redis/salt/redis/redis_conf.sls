redis_conf:
  file.managed:
    - name: /etc/redis.conf
    - source: salt://redis/templates/redis.j2
    - user: root
    - group: root
    - template: jinja
    - mode: 0644
    - require:
      - pkg: install_redis

  cmd.run:
    - name: mkdir -p /data/redis && chown redis.redis -R /data/redis
    - unless: test -d /data/redis
