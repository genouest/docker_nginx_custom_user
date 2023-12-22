# docker_nginx_custom_user

Custom Docker image for nginx

Will create a custom user, and launch nginx workers as that user.

Available env variables:

```
RUN_USER: (Optional, require UID) Custom user for custom command
UID: (Optional), require RUN_USER) Custom user UID for custom command
RUN_GROUP: (Optional, require GID) Custom user group for custom command
GID: (Optional), require RUN_GROUP) Custom group GID for custom command
OTHER_GID: (Optional) Other groups ID to add
```
