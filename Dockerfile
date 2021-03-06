FROM danis24/apache
MAINTAINER Danis Yogaswara <danis@aniqma.com>

RUN apt-get update -y
RUN apt-get install -y software-properties-common python-software-properties
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y && apt-get -y install php7.1 php7.1-mysql php7.1-mbstring php7.1-xml php7.1-mcrypt php7.1-json &&  apt-get clean && rm -rf /var/lib/apt/lists/*
RUN /usr/sbin/a2dismod 'mpm_*' && /usr/sbin/a2enmod mpm_prefork

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
