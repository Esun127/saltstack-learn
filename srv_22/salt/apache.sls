install_httpd:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - name: httpd
  {% elif grains['os_family'] == 'Debian' %}
    - name: apache2
  {% endif %}

install_vim:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
  {% elif grains['os'] == 'Debian' %}
    - name: vim-nox
  {% endif %}

{% if grains['os'] == 'Arch' %}
vim_conf:
  file.managed:
    - source: salt://vimrc
    - name: /etc/vimrc
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: install_vim
{% endif %}
