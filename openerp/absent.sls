openerp6.1-full:
  pkg:
    - purged
    - require:
      - service: openerp-server
  pkgrepo:
    - absent
    - ppa: credativ/openerp-6.0-releases

openerp-server:
  service:
    - dead

/etc/openerp:
  file:
    - absent
    - require:
      - pkg: openerp-server
