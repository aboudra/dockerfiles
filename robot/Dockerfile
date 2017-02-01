FROM ubuntu:xenial

COPY setup-sshd /usr/sbin/setup-sshd

RUN echo 'deb http://archive.ubuntu.com/ubuntu xenial main universe' > /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common \
 && add-apt-repository -y ppa:git-core/ppa \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
 bzip2 \
 chromium-chromedriver \
 curl \
 firefox \
 fonts-liberation \
 git \
 libappindicator1 \
 libfontconfig \
 libpango1.0-0 \
 openjdk-8-jdk \
 openssh-server \
 python-decorator \
 python-pip \
 python-requests \
 python-selenium \
 python-setuptools \
 python-wheel \
 python-xvfbwrapper \
 sudo \
 vim \
 wget \
 xvfb \
 zip \
 && wget -q \
 https://github.com/mozilla/geckodriver/releases/download/v0.13.0/geckodriver-v0.13.0-linux64.tar.gz \
 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
 https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && dpkg -i *.deb \
 && tar xf geckodriver-*.tar.gz \
 && tar xf phantomjs-*.tar.bz2 \
 && mv geckodriver /usr/bin/ \
 && mv phantomjs-*/bin/phantomjs /usr/bin/ \
 && pip install \
 robotframework \
 robotframework-requests \
 robotframework-selenium2library \
 robotframework-xvfb \
 && apt-get clean \
 && rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 phantomjs-* \
 *.tar.* \
 *.deb

RUN useradd -m user \
 && echo 'user ALL = NOPASSWD: ALL' > /etc/sudoers.d/jenkins \
 && chmod 0440 /etc/sudoers.d/jenkins \
 && mkdir -p /var/run/sshd /home/user/bin

EXPOSE 22
ENTRYPOINT ["/usr/sbin/setup-sshd"]