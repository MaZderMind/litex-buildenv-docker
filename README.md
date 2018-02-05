Build-Environment Litex-SoCs
============================
//Build-Environment in a Docker-Container for Litex-Based SoCs//

Why?
----
To synthesize a Litex-Firmware you need a recent python and a licensed installation of Xilinx ISE WebPACK. Both is relatively easy to install locally.
The tools to flash the Firmware are a little bit more complex to get running, because often there's an intermediate FX2-Style USB-Controller inbetween the FPGA and the Computer, which needs to be programmed first.
For compiling Firmware for an lm32 compatible embedded SoftCore, you really need a custom compiled version of gcc and binutils and a lot of supporting libraries and tooling.

This is where this Container comes in handy: instead of installing all the dependencies onto your machine, you just execute your build script in the context of this container, which has all the required perquisites installed.
Also the compile-phase can much simpler be ported onto different computers, for example a generic build-system. All that's needed there is docker (and ISE*, well…), all other dependencies are packed into the container..

*) Technically you can also pack an installed version of ISE and a License-File into a container, but you are legally not allowed to redistribute that, and your build-container will be >10GB in size.

How?
----
```
docker run --rm --user=`id -u` --group=`id -g` -it litex-buildenv-docker ./build-script/make.py -vv firmware
```

Who?
----
peter AT mazdermind DOT de
