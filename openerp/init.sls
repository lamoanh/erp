include:
  - postgresql
  - underscore

openerp-server:
  pkgrepo:
    - managed
    - ppa: credativ/openerp-6.0-releases
  pkg:
    - installed
    - name: openerp6.1-full
    - require:
      - pkg: libjs-underscore
      - service: postgresql
      - pkgrepo: openerp-server
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
