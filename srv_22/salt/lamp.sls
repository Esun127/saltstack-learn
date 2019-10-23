install_httpd: 
  pkg.installed:
    - name: httpd

httpd_running:
  service.running:
    - name: httpd
    - enable: True
    - require:
      - pkg: install_httpd  

httpd_conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://httpd.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: install_httpd  
    - watch_in:
      - service: httpd_running 

install_php:
  pkg.installed:
    #- name: php_all
    - pkgs:
      - php
      - php-mysql
      - php-common
      - php-gd
      - php-mbstring
      - php-mcrypt
      - php-devel
      - php-xml
    - require:
      - pkg: install_httpd 

php_conf:
  file.managed:
    - name: /etc/php.ini
    - source: salt://php.ini
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: install_php
    - watch_in:
      - service: httpd_running

install_mysql:
  pkg.installed:
    - name: mysql
    - pkgs:
      - mariadb-server
      - mariadb

mysql_conf:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://my.cnf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: install_mysql
    - watch_in:
      - service: mysql_running

mysql_running:
  service.running:
    - name: mariadb
    - enable: True
    - require:
      - pkg: install_mysql
