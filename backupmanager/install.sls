{% from "backupmanager/map.jinja" import map with context %}

backupmanager:
  pkg.installed:
    - name: {{ map.get('pkg') }}
