# **Intel-FPGA-Quartus**

 Example of how to program an Altera FPGA with Intel Quartus and VHDL.

 <img src="https://i.ibb.co/nnCw0Dq/20210101-220215.jpg" width="1000">

 # **Table of contents**

- [**Intel-FPGA-Quartus**](#intel-fpga-quartus)
- [**Table of contents**](#table-of-contents)
- [**Introduction**](#introduction)
- [**OS**](#os)
- [**Software**](#software)
- [**Blaster USB Setup**](#blaster-usb-setup)
- [**Project**](#project)
- [**Code and Assignments**](#code-and-assignments)
  - [**Code:**](#code)
  - [**Assignment:**](#assignment)
  - [**Compile and Program:**](#compile-and-program)
- [**EPIC DEMO:**](#epic-demo)

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

## **Code:**
In this case I am programming the FPGA in VDHL (although it is possible to use Verilog as well)

All the necessary files will be in the "Code, Sof and Assigments" folder.

Basically the code I use is an 8-bit binary up counter, with an enable switch and a buzzer (integrated in the board)

    entity StormIV_Test is
        port (
            LED   :out std_logic_vector (7 downto 0);  -- Output of the counter
            clk    :in  std_logic;                      -- Input clock
            enable : in std_logic;
            BEEP : out std_logic
        );
    end entity;

In this case we can see that our entity has "variables" LED for the output to the LEDs, a clk that is the main clock of the board (50 MHZ), an enable that will help us to enable and disable the count and a BEEP that will be the buzzer.

## **Assignment:**

In this section we are going to relate the variables declared in / out with the physical ports of the board.

**NOTE: Because I'm using a fairly cheap board, I had to create the Assignments file from scratch, checking port by port, if you have any errors please feel free to modify it.**

The AssigmentsSTORM.qsf file specifically relates each of the board's ports with its integrated components (LEDs, 7 segments, Serial, etc).

<img src="https://i.ibb.co/ZgZjMYH/image.png" width="600">

## **Compile and Program:**

Once we have everything ready, we can compile the code and program the FPGA.

<img src="https://i.ibb.co/9cSQB4p/image.png" width="600">

If the whole process went well, we should see a Compile design check mark, this indicates that we can program the FPGA with the code.

To program the FPGA we must go to Tools/Programmer

<img src="https://i.ibb.co/kSZXykD/image.png" width="600">

Once there we can program the FPGA by pressing the Start button.

<img src="https://i.ibb.co/tmsmwh7/image.png" width="600">

# **EPIC DEMO:**

Video: Click on the image
[![FPGA](https://i.ibb.co/nnCw0Dq/20210101-220215.jpg)](https://youtu.be/pKwcr6r0GOY)

Sorry github does not allow embed videos.

