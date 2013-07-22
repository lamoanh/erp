libjs-underscore:
  pkgrepo:
    - absent
    - ppa: chris-lea/libjs-underscore
    - require:
      - pkg: libjs-underscore
  pkg:
    - purged
