## laravel_vagrant

An example starter project to get a portable development environment running a Laravel application with no configuration required.

### Installation

Once you have [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) installed you can simply clone this repository and run two `vagrant` commands to have a Laravel application running within the VM that you can access from the browser on your machine at `localhost:4567`.

```
  git clone https://github.com/cih/laravel-vagrant.git
  vagrant box add laravel/homestead
  vagrant up
```


