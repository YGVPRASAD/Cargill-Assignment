FROM centos
MAINTAINER ygvprasad@gmail.com
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx
COPY ./html/nginx/* /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g daemon off;"]
