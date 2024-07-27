FROM centos
MAINTAINER rockykumar0101@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
CMD /bin/bash
RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
#ADD https://freewebsitetemplates.com/download/frozenyogurtshop.zip /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN sh -c 'unzip -q "*.zip"'
RUN cp -rvf frozenyogurtshop/* .
RUN rm -rf frozenyogurtshop frozenyogurtshop.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
