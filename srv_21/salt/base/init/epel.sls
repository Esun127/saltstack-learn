install epel-release:
  pkg.installed:
    - name: epel-release
    - unless: rpm -qa | grep epel-release

rebuild yum_repos cache:
  cmd.run:
    - name: rm -rf /var/cache/yum && yum makecache fast
