---
{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('node') %}
key_accept: 
  wheel.key.accept:
    - match: {{data['id']}}
{% endif %}
