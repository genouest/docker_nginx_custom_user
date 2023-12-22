# docker_nginx_custom_user

Custom Docker image for nginx

Will create a custom user, and launch nginx workers as that user.

Available env variables:

```
RUN_USER: (Optional, require UID) Custom user for nginw worker. Default to nginx.
UID: (Optional), require RUN_USER) Custom user UID for nginx worker.
RUN_GROUP: (Optional, require GID) Custom user group for nginx worker. Default to nginx.
GID: (Optional), require RUN_GROUP) Custom group GID for nginx worker.
OTHER_GID: (Optional) Other groups ID to add.
```
