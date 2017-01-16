FROM ubuntu:16.04
MAINTAINER Anton Fisher <a.fschr@gmail.com>

USER root

# Set timezone
RUN echo "America/Los_Angeles" > /etc/timezone &&\
    dpkg-reconfigure --frontend noninteractive tzdata &&\
    date

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Configure and update apt-get
ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get -q update &&\
    apt-get -q install -y -o Dpkg::Options::="--force-confnew" apt-utils &&\
    apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends

# Install dependencies
RUN apt-get -q install -y -o Dpkg::Options::="--force-confnew" \
    libltdl-dev \
    libltdl7 \
    sshpass \
    vim

# Clean-up apt-get
RUN apt-get -q autoremove &&\
    apt-get -q clean -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -f /var/cache/apt/*.bin

# Disable StrictHostKeyChecking for ssh
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# staying online before force stop container
CMD ["tail", "-f", "/dev/null"]
