{% from "backupmanager/map.jinja" import map with context %}

{{ map.lookup.conf_file }}:
  file.managed:
    - user:     root
    - group:    {{ map.repository.group }}
    - mode:     640
    - template: jinja
    - source:   {{ map.lookup.conf_file_source }}
    - context:
        included: False
