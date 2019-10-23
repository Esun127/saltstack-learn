redis_running:
  service.running:
    - name: redis
    - watch:
      - file: redis_conf
    - require:
      - pkg: install_redis
