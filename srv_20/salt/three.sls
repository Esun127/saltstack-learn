---
ntpdate:
  pkg.installed
sync datetime by command:
  cmd.run:
    - name: ntpdate time1.aliyun.com
    - onlyif: which ntpdate
