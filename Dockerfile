FROM nginx:1.25.3

ADD /scripts/ /scripts/
ADD /nginx/nginx.conf.template /
COPY /conf/default.conf /etc/nginx/conf.d/default.conf
ADD entrypoint.sh /


ENV RUN_USER='nginx'
ENV RUN_GROUP='nginx'

ENTRYPOINT ["/entrypoint.sh"]
