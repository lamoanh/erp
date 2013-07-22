include:
  - libjs-underscore.absent

{% for name in 'openerp6.1-core','openerp6.1-full'  %}
{{ name }}:
  pkg:
    - purged
    - require:
      - service: openerp-server
{% endfor %}

openerp-server:
  service:
    - dead

/etc/openerp/openerp-server.conf:
  file:
    - absent
    - require:
      - service: openerp-server
