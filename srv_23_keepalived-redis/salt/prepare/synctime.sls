install_ntpdate:
  pkg.installed:
    - name: ntpdate


sync_datetime:
  cmd.run:
    - name: ntpdate time1.aliyun.com
    - require:
      - pkg: install_ntpdate

cron_datetime:
 cron.present:
   - name: /usr/sbin/ntpdate time1.aliyun.com 1> /dev/null 2 >&1
   - user: root
   - minute: '*/5'
   - require:
     - pkg: install_ntpdate

