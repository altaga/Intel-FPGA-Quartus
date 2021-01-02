# **Intel-FPGA-Quartus**
 Example of how to program an Altera FPGA with Intel Quartus and VHDL.

 # **Table of contents**

- [**Intel-FPGA-Quartus**](#intel-fpga-quartus)
- [**Table of contents**](#table-of-contents)
- [**Introduction**](#introduction)
- [**OS**](#os)
- [**Software**](#software)
- [**Blaster USB Setup**](#blaster-usb-setup)
- [**Project**](#project)
- [**Code and Assignments**](#code-and-assignments)

# **Introduction**

Whatever FPGA you use, they are always going to have a huge advantage over microcontrollers and microprocessors.

A field programmable gate array (FPGA) contains a matrix of reconfigurable gate array logic circuitry that, when configured, is connected in a way that creates a hardware implementation of a software application. Increasingly sophisticated tools are enabling embedded control system designers to more quickly create and more easily adapt FPGA-based applications.

Unlike processors, FPGAs use dedicated hardware for processing logic and do not have an operating system. Because the processing paths are parallel, different operations do not have to compete for the same processing resources. That means speeds can be very fast, and multiple control loops can run on a single FPGA device at different rates.

# **OS**

In this case, you can use Windows or Linux to install the software.

I will use Linux because it requires less configuration and has fewer problems with the FPGA programmer (Blaster) drivers.

[**Ubuntu**](https://ubuntu.com/download/desktop)

# **Software**

Quartus Prime Lite in my case with devices CycloneIV support.
https://www.intel.com/content/www/us/en/programmable/downloads/download-center.html

# **Blaster USB Setup**

Extra configuration is required for the Blaster to work properly.

In the path /etc/udev/rules.d we have to create a text file called 90-usb-blaster.rules with the following content.

    SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"

<img src="https://i.ibb.co/4gRR3Sh/image.png" width="600">

# **Project**

To create the project, I use the project wizard as it will guide us step by step to configure and select the correct device.

<img src="https://i.ibb.co/zmqZgkk/image.png" width="600">

In this case my board has the following version.

<img src="https://i.ibb.co/9bKRXHw/image.png" width="600">

Here is a picture of the chip on my board (EP4CE6E22C8).

<img src="https://i.ibb.co/9cbfQFW/20210101-213102.jpg" width="600">

# **Code and Assignments**

En este caso estoy programando la FPGA en VDHL (aunque es posible utilizar Verilog tambien)

Todos los archivos necesarios estaran en la carpeta "".

