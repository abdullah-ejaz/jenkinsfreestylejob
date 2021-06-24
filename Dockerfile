# Set the base image to Ubuntu
#FROM ubuntu:18.04

# File Author / Maintainer
#MAINTAINER abdullah

#USER root
# Install Nginx

# Add application repository URL to the default sources
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
#RUN apt-get update

# Install necessary tools
#RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
#RUN apt-get install -y nginx  

# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/


#ADD web /usr/share/nginx/html/
#ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
#EXPOSE 80

# Set the default command to execute
# when creating a new container
#CMD service nginx start
#
# BudgetTracker Dockerfile for UI
#
FROM ubuntu:latest
MAINTAINER "abdullah@gmail.com"

USER root

RUN apt-get update
RUN apt-get install -y nginx nodejs

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

ADD web /usr/share/nginx/html/
ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 6000

# Set the default command to execute
# when creating a new container
CMD service nginx start
