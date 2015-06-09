## NodeJS Development Environment with Itamae

Build NodeJS development environment VM with [Itamae](https://github.com/itamae-kitchen/itamae).

This cookbook suport in Vagrant and Docker.

### Vagrant

If installed vagrant plugin [vagrant-itamae](https://github.com/chiastolite/vagrant-itamae) , possible constructed in the following.

```sh
vagrant up

vagrant ssh

# installed nodejs versions
ndenv versions
```

Use ssh

```sh
bundle itamae ssh --vagrant -h default -j nodes/vagrant.json cookbooks/base/node_build.rb
```

### Dcoker

Build Dcoker environment.

```sh
# create container
bundle exec itamae docker cookbooks/base/node_build.rb --node-json=nodes/node.json --image=IMAGE --no-tls-verify-peer

# docker run
docker run -it ContainerID /bin/bash

# installed nodejs versions
ndenv versions
```

### Spec

```
bundle exec rake spec
```

