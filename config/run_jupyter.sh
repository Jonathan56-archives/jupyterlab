#!/bin/bash

cd ~
mkdir .jupyter

# copy the jupyter configuration into home-directory
cp -r ${CONFIG_PATH}/jupyter_notebook_config.py ~/.jupyter/

cd /usr/local/bin/lanceyjupyterlab/


# edit the python3 kernel, that already imports os,sys and the paths to the app and test
cat > /usr/local/share/jupyter/kernels/python3/kernel.json <<EOKERN
{
    "display_name": "Python 3",
    "language": "python",
    "argv": [
        "python3",
        "-c", "import sys, os; sys.path.insert(0, os.path.dirname(os.environ['LIBS_PATH'])); import libs.nbimport; from IPython.kernel.zmq.kernelapp import main; main()",
        "-f", "{connection_file}"
    ],
    "codemirror_mode": {
        "version": 2,
        "name": "ipython"
    }
}
EOKERN

# Add plotly extension
# Avoid "JavaScript heap out of memory" errors during extension installation
# (OS X/Linux)
export NODE_OPTIONS=--max-old-space-size=4096

# Jupyter widgets extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 --no-build

# FigureWidget support
jupyter labextension install plotlywidget@1.5.0 --no-build

# and jupyterlab renderer support
jupyter labextension install jupyterlab-plotly@1.5.0 --no-build

# Install git extension
pip install --upgrade jupyterlab-git

# Table of content extension
jupyter labextension install @jupyterlab/toc

# Build extensions (must be done to activate extensions since --no-build is used above)
jupyter lab build

# Unset NODE_OPTIONS environment variable
# (OS X/Linux)
unset NODE_OPTIONS

jupyter lab
