FROM centos:centos6

MAINTAINER donatas.navidonskis@gmail.com

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node...
RUN yum install -y npm

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
COPY package.json /app
RUN npm install

# Bundle app source
COPY . /app

EXPOSE 3000
#CMD [ "npm", "start" ]
CMD node app.js