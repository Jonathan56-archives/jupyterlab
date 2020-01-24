
# JupyterLab-Configuration

The [JupyterLab-Configurator](https://www.lean-data-science.com) lets you easily create your **JupyterLab configuration** that runs JupyterLab in a **container** and automates the whole setup using **scripts**.

```console
foo@bar:~$ docker build -t lanceyjupyterlab -f config lanceyjupyterlab.Dockerfile .

foo@bar:~$ docker run -ti --detach --rm -p 10080:8888 \ -v ${PWD}:/usr/local/bin/lanceyjupyterlab lanceyjupyterlab
```
