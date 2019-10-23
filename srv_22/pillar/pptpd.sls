pptp:
  localip: {{grains.fqdn_ip4}}
  remoteip: 10.0.0.100-120
  users:
     user1: hello123
     user2: nihao123


bind:
  nameservers: 
    - 8.8.8.8
    - 4.4.4.4
