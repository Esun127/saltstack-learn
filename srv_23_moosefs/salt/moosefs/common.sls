moosefs_repo_key:
  file.managed:
    - name: /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS 
    - source: salt://moosefs/files/RPM-GPG-KEY-MooseFS
    - user: root
    - group: root
    - unless: 'test -f /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS'

moosefs_repo:
  file.managed:
    - name: /etc/yum.repos.d/MooseFS.repo
    - source: salt://moosefs/files/MooseFS.repo
    - user: root
    - group: root
    - unless: 'test -f /etc/yum.repos.d/MooseFS.repo'

mfs:
  pkg.installed:
    - pkgs:
#      - moosefs-master
#      - moosefs-cgi
#      - moosefs-cgiserv
#      - moosefs-cli
      - moosefs-chunkserver
#      - moosefs-metalogger
#      - moosefs-client
    - require:
      - file: moosefs_repo_key
      - file: moosefs_repo

