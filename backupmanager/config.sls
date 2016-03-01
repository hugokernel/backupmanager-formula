{% from "backupmanager/map.jinja" import map with context %}

{% set template_file = salt['pillar.get']('backupmanager:lookup:template_file', 'salt://backupmanager/files/backup-manager.conf') %}

{{ map.get('conf-file') }}:
  file.managed:
    - user:     {{ map.get('user', 'root') }}
    - group:    {{ map.get('group', 'root') }}
    - mode:     440
    - template: jinja
    - source:   {{ template_file }}
    - context:
        included: False
