include:
  - postgresql
  - underscore

openerp-server:
  pkg:
    - installed
    - name: openerp6.1-full
    - skip_verify: True
    - require:
      - pkg: libjs-underscore
      - pkg: postgresql
  service:
    - running
    - enable: True
    - require:
      - pkg: openerp-server
    - watch:
      - file: /etc/openerp/openerp-server.conf

/etc/openerp/openerp-server.conf:
  file:
    - managed
    - source: salt://openerp/config.jinja2
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - require:
      - pkg: openerp-server
