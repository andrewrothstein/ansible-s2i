andrewrothstein.s2i
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-s2i.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-s2i)

Installs [source-to-image](https://github.com/openshift/source-to-image)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.s2i
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
