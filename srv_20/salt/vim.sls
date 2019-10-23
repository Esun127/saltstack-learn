---
vim-enhanced:
  pkg.installed

/root/.vimrc:
  file.append:
    - text: |
         set ts=4
         set sw=4
         set si
         set ai
         set et
         syntax on
