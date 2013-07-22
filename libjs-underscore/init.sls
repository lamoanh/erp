libjs-underscore:
  pkgrepo:
    - managed
    - ppa: chris-lea/libjs-underscore
  pkg:
    - latest
    - skip_verify: True
    - require:
      - pkgrepo: libjs-underscore
