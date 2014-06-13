## Vocabulary
- `host`:  
  Your main OS. It could be MAC-OS or Windows.  

- `box`:  
  This is your virtual machine created by [vagrant]().  
  To be precise, it's a [virtualbox]() virtual machine. But the `box` management
  is done by vagrant.

- `guest`:  
  This is the OS running inside your box. Normally the latest Ubuntu [LTS]()
  server

- `provision`:  
  To install/upgrade/configure custom software into the `box`

- `Vagrantfile`:  
  This file contains all the configuration need by vagrant.

- `box's home`:  
  This is the directory where the `Vagrantfile` is located and its contents are
  shared with the `guest`

## 0)  Requirements
You must have a `virtualbox` and `vagrant` installation. Look [here]() for
instructions

## 1) Install this vagrant box

- git clone the vagrant `box`:
  ```bash
  [local]$ git clone --depth=1 http....
  ```

- install your vagrant `box` `ssh` in the box, and:
```bash
  [local]$ vagrant up --no-provision && vagrant ssh
  ```

- Now you will be downloading Ubuntu's server image, it may take while.  
  The official `ubuntu box` will be installed and you should see something like this.

  ```
  Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-29-generic x86_64)

   * Documentation:  https://help.ubuntu.com/

   System information disabled due to load higher than 1.0

    Get cloud support with Ubuntu Advantage Cloud Guest:
      http://www.ubuntu.com/business/services/cloud

  0 packages can be updated.
  0 updates are security updates.

  vagrant@vagrant-ubuntu-trusty-64:~$
  ```

  If you got this far, this means your `virtualbox` and `vagrant` are working
  well together and our `base box` is up and running.

- exit box, reload it, and run provisions:

  - this time around, it may take a long while all provisions are being
  run. You may go grab a coffee

    ```bash
    vagrant@vagrant-ubuntu-trusty-64:~$ exit
    [local] $ vagrant reload && vagrant ssh
    ```

  - and now, you should see something like this.

    ```
    Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-29-generic x86_64)

     * Documentation:  https://help.ubuntu.com/

      System information as of Thu Jun 12 15:03:11 UTC 2014

      System load:  0.3               Processes:           96
      Usage of /:   2.7% of 39.34GB   Users logged in:     0
      Memory usage: 13%               IP address for eth0: 10.0.2.15
      Swap usage:   0%                IP address for eth1: 192.168.34.10

      Graph this data and manage this system at:
        https://landscape.canonical.com/

      Get cloud support with Ubuntu Advantage Cloud Guest:
        http://www.ubuntu.com/business/services/cloud

    0 packages can be updated.
    0 updates are security updates.

    - OS: Ubuntu 14.04 "trusty" server-amd64
    - NodeJS: stable (0.10.x) and latest (0.11.x)
    - MongoDB: stable (2.6.1)
    - Packer: stable (0.6.0)
    - Docker: stable (1.0.0)

    Last login: Thu Jun 12 15:02:22 2014 from 10.0.2.2
    vagrant@vagrant-ubuntu-trusty-64:~$
    ```

  - test the shared directory
    ```bash
    vagrant@vagrant-ubuntu-trusty-64:~$ ls /vagrant
    bootstrap.pp  home-dir-ubuntu.tgz  notes.md  shell-provisions  Vagrantfile
    ```

    If your `/vagrant` directory is empty, this means you `guest additions` is
    not working. Take a look [here]() for instructions.

    #### Congrats. Now you are set to go.


## 2) sync git repositories

- You must be in the `box's home` directory on your `host`

  ```bash
    [local]$ vagrant up && vagrant ssh
    Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-29-generic x86_64)
        ...    ...    ...    ...
    vagrant@vagrant-ubuntu-trusty-64:~$
  ```

## vagrant cheatsheet:  
  The directory where your `Vagrantfile` is located on the `mac/windows host`
  is shared with the `ubuntu guest`

  - turn the box on:
  ```bash
  [local]$ vagrant up # provisions are only run on first time running this command.
  ```
  - go inside the box:
  ```bash
  [local]$ vagrant ssh
  ```
  - exit the box:
  ```bash
  vagrant@vagrant-ubuntu-trusty-64:~$ exit
  ```
  - turn the box off:
  ``` bash
  [local]$ vagrant halt
  ```
  - turn the box on and go inside of it:
  ```bash
  [local]$ vagrant up && vagrant ssh
  ```
  - turn the box on and run provisions:
  ```bash
  [local]$ vagrant up --provision
  ```
  - turn the box on and **don't** run provisions. Useful on first time bringing
  the `box` up
  ```bash
  [local]$ vagrant up --no-provision
  ```
  - reload the box:
  ```bash
  [local]$ vagrant reload # a shortcut for `vagrant halt && vagrant up`
  ```
  - reload, re-provision, and go inside of the `box`:
  ```bash
  [local]$ vagrant reload --provision && vagrant ssh
  ```
