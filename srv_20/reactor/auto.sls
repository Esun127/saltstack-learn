---
run_state:
  local.state.sls:
    - tgt: {{data['id']}}
    - arg:
      - shencan

run_init:
  local.cmd.run:
    - tgt: {{data['id']}}
    - arg:
      - echo initsok >> /tmp/cpis

set_hostname:
  local.cmd.run:
    - tgt: {{data['id']}}
    - arg:
      - hostnamectl --static set-hostname {{data['id']}}
