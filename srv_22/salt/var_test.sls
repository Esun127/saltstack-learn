{% set var='Hello China' %}
test_var:
  cmd.run:
    - name: echo "var is {{var}}"
{% set list=['ont', 'two', 'three'] %}
test_list:
  cmd.run:
    - name: echo "list[1] is {{list[1]}}"
{% set dict={'first':1, 'second': 2} %}
test_dict:
  cmd.run:
    - name: echo "dict['second'] is {{dict.second}}"
test_users:
  cmd.run:
    - name: echo {{ users }}
