{% from "backupmanager/map.jinja" import map with context %}

backupmanager:
  pkg.installed:
    - name: {{ map.lookup.pkg }}

{{ map.repository.root }}:
  file.directory:
    - user: {{ map.repository.user }}
    - group: {{ map.repository.group }}
    - mode: {{ map.repository.chmod }}
    - makedirs: True

{{ map.lookup.cron_file }}:
  file.managed:
    - user:     root
    - group:    root
    - mode:     751
    - template: jinja
    - source:   {{ map.lookup.cron_file_source }}
    - defaults:
          bin: {{ map.lookup.bin }}
    - context:
        included: False
