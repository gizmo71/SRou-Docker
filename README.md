You'll need to add a file called `.env` with values along the following lines:

```
SROU_ENV=
SROU_GLUSTER_ROOT=srou
DB_PORT=13305
HTTP_PORT=8091
SFTP_PORT=8023
```

Note that these files are currently dependent on other files, especially `Dockerfiles`, which are not publicly available.
