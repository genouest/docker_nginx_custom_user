FROM nginx:1.25.3

ADD /nginx/templates/default.conf /etc/nginx/templates/default.conf
ADD /scripts/ /scripts/
ADD entrypoint.sh /

ENV RUN_USER='nobody'

ENTRYPOINT ["/entrypoint.sh"]
