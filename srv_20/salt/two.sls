ntpdate:
  pkg.installed
setcronenv:
  cron.env_present:
    - name: PATH
    - value: /usr/bin:/usr/local/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin
setcronjob:
  cron.present:
    - name: ntpdate time1.aliyun.com &> /dev/null
    - minute: '*/5'
    - identifier: set datetime sync job
