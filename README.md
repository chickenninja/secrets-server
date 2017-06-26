# secrets-server
stop hardcoding, committing or jotting down secrets!

This utility requires the following:
- nodejs
- curl
- bash

run 
```bash
npm install
```
to install the node dependencies.

run 
```bash
npm test
```
to test that everything is set up ok

add your secrets to
```bash
./secrets/
```

then run 
```bash
./get-secret.sh {secret name}
```
to show your secret on the command line.

How I use it
---

Add a script such as /usr/bin/my-secret as follows (make sure it has the correct permissions)
``` bash
/path/to/secrets-server/get-secret.sh $1
```

now in Dockerfiles, commandline entries or scripts you can use...
```bash
$(my-secret somepassword)
```
to obtain a secret, without having to hardcode it or commit it to a specific project.
