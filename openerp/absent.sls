openerp-server:
  pkg:
    - purged
    - names:
      - openerp6.1-core
      - openerp6.1-full
    - required:
      - pkg: libjs-underscore
  service:
    - dead
    - required:
      - pkg: openerp-server

/etc/openerp/openerp-server.conf:
  file:
    - absent
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - required:
      - pkg: openerp-server

libjs-underscore:
  pkgrepo:
    - absent
    - ppa: chris-lea/libjs-underscore
  pkg:
    - purged
    - required:
      - pkgrepo: libjs-underscore
