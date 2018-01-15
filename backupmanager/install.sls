{% from "backupmanager/map.jinja" import map with context %}

{% set cron_file = salt['pillar.get']('backupmanager:lookup:cron_file', 'salt://backupmanager/files/cron.sh') %}

backupmanager:
  pkg.installed:
    - name: {{ map.get('pkg') }}

{{ map.repository.root }}:
  file.directory:
    - user: {{ map.user }}
    - group: {{ map.group }}
    - mode: {{ map.chmod }}
    - makedirs: True

{{ map.get('cron-daily-file') }}:
  file.managed:
    - user:     root
    - group:    root
    - mode:     751
    - template: jinja
    - source:   {{ cron_file }}
    - defaults:
          bin: {{ map.get('bin', '/usr/sbin/backup-manager') }}
    - context:
        included: False
