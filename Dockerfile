# Use an official ubuntu:16.04  runtime as a parent image
FROM ubuntu:16.04


# Define environment variable 
ENV REFRESHED_AT 2018-05-05

#Update system and install some dependent packages
RUN apt-get update && apt-get install  -y wget  libx11-dev 


# Set the working directory to /home/work
WORKDIR /home/work


# Copy the current directory contents into the container at /home/work
#COPY  ./gnuarmeclipse-qemu-debian64-2.8.0-201703022210-head.tgz  /home/work/

#Install cross toolchain for cortex-M3 processors
RUN  wget https://github.com/gnu-mcu-eclipse/qemu/releases/download/gae-2.8.0-20170301/gnuarmeclipse-qemu-debian64-2.8.0-201703022210-head.tgz  \
     && tar xf gnuarmeclipse-qemu-debian64-2.8.0-201703022210-head.tgz  -C /opt \
     && rm -rf gnuarmeclipse-qemu-debian64-2.8.0-201703022210-head.tgz

#invoke the PATH for qemu
ENV PATH="/opt/gnuarmeclipse/qemu/2.8.0-201703022210-head/bin/:${PATH}"


# Set the working directory to gnuarmeclipse/qemu/2.8.0-201703022210-head/bin/
#WORKDIR /home/work/gnuarmeclipse/qemu/2.8.0-201703022210-head/bin


# Make port 1234 available to the world outside this container
EXPOSE 1234


# Run  command when the container launches
#CMD ["qemu-system-gnuarmeclipse", "-help"]
