# kitchen-transport-rsync

[![Build Status](https://api.travis-ci.org/unibet/kitchen-transport-rsync.svg)](https://travis-ci.org/unibet/kitchen-transport-rsync)
[![Gem Version](https://badge.fury.io/rb/kitchen-transport-rsync.svg)](http://badge.fury.io/rb/kitchen-transport-rsync)

This transport is based on rsync over ssh providing dramatic performance improvements.
It will only work with TK 1.4 and rsync has to be available in the PATH on both local and remote end points.

Only passwordless (using ssh key pair) communication is supported at the moment.

## Recommended **.kitchen.yml** snippet to activate Rsync transport

```
transport:
  name: rsync
  ssh_key: ~/.vagrant.d/insecure_private_key
  username: vagrant
```

## Gemfile
```
gem 'kitchen-transport-rsync'
```
