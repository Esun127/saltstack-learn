/etc/bashrc:
  file.append:
    - text:
      - export PROMPT_COMMAND='{ msg=$(history 1 | { read x y; echo $y; }); logger "[euid=$USER":$(who am i):['pwd']"$msg"; }'
