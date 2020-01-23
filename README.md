# jupyterlab
Deploy a jupyter lab on the server.

```console
foo@bar:~$ docker build --rm -t jupyterlab/my-notebook .

foo@bar:~$ docker run --detach  --rm -p 10080:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyterlab/my-notebook

foo@bar:~$ docker logs --tail 20 cd612d2
```
