set_iptables:
  pkg.installed:
    - name: iptables
    - watch_in:
      - service.set_iptables
  service.running:
    - name: iptables
  file.managed:
    - source: salt://iptables
    {% if grains['os'] == 'CentOS' or grains['os'] == 'Fedora' %}
    - name: /etc/sysconfig/iptables
    {% elif grains['os'] == 'Arch' %}
    - name: /etc/conf.d/iptables
    {% endif %}
    - watch_in:
      - service.set_iptables
