# OpenWRT development environment

These environment use the dockers [openwrtorg/sdk](https://hub.docker.com/r/openwrtorg/sdk) [openwrtorg/rootfs](https://hub.docker.com/r/openwrtorg/rootfs)
[openwrtorg/imagebuilder](https://hub.docker.com/r/openwrtorg/imagebuilder) to setup a proper environment for OpenWRT.

There are scripts to start and setup the enviroment:

* start-ide-sdk-XXX.sh -> starts a docker to use an IDE with the OpenWRT SDK toolchain.
* start-image-build-XXX.sh -> start a docker to build an OpenWRT image.
* start-rootfs-XXX.sh -> start a docker with an OpenWRT runtime

Mounted dir

* `sources` will be mounted in docker `/home/build/sources/`
* `bin` will be mounted in docker `/home/build/openwrt/bin/`
* `build-output` will be mounted in docker `/home/build/build-output/`
* `sdk` will be mounted in docker `/home/build/sdk`
* `$HOME` will be mounted in docker `$HOME`

An OpenWRT toolchain for cmake you will found in:

`/home/build/sdk/openwrt.toolchain.cmake`

## How to build an openwrt image

Checkout the openwart repo into the source dir:

`git clone https://github.com/openwrt/openwrt.git sources/openwrt`

Start the imagebuilder for example for the `ar71xx` board for OpenWRT 19.XX:

`./start-image-build-ar71xx-v19.sh`

You will see the OpenWRT menuconfig. After you save your settings and exit you will have a shell:

`build@yourhostname:~$ `

Change to the OpenWRT sources and execute the build:

```
cd /home/build/sources/openwrt
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
make
```

Once finished the compiled firmware image ending with `.bin` will be placed for example under `openwrt/bin/ar71xx` directory:

`/home/build/sources/openwrt/bin/targets/ar71xx/generic`
    
or from on the host see:

`sources/openwrt/bin/targets/ar71xx/generic`
