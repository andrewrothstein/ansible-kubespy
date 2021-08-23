andrewrothstein.kubespy
=========
![Build Status](https://github.com/andrewrothstein/ansible-kubespy/actions/workflows/build.yml/badge.svg)

Installs [kubespy](https://github.com/pulumi/kubespy).

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
    - andrewrothstein.kubespy
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
