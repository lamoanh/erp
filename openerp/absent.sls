openerp6.1-full:
  pkg:
    - purged
    - require:
      - service: openerp-server

openerp-server:
  service:
    - dead

/etc/openerp:
  file:
    - absent
    - require:
      - service: openerp-server
