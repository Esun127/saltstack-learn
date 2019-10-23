base:
  'node2':
    - roles.master
    - roles.datanode
  'node3':
    - roles.backup
    - roles.datanode
  'node4':
    - roles.datanode
