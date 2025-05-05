FROM centos:latest
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget zip -y
RUN wget -O /var/www/html/healet.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip
WORKDIR /var/www/html
RUN unzip healet.zip
RUN cp -rf healet-html/* .&&\
    rm -rf healet-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
