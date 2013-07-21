include:
  - postgresql

libjs-underscore:
  pkgrepo:
    - managed
    - ppa: chris-lea/libjs-underscore
  pkg:
    - installed
    - version: 1.3.3-1ubuntu1
    - required:
      - pkgrepo: libjs-underscore

openerp-server:
  pkg:
    - installed
    - names: 
      - openerp6.1-core
      - openerp6.1-full
    - required:
      - pkgs:
        - libjs-underscore
        - postgresql
  service:
    - running
    - enable: True
    - required:
      - pkg: openerp-server

/etc/openerp/openerp-server.conf:
  file:
    - managed
    - source: salt://openerp/openerp-server.conf
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - required:
      - pkg: openerp-server
