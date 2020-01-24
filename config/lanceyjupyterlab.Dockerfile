FROM leandatascience/jupyterlab-ds-ml:latest

# Env variables
ENV MAIN_PATH=/usr/local/bin/lanceyjupyterlab/jupyterlab
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

# Needed?
EXPOSE 8888

# Install glpk (glpsol):
RUN apt-get update && \
    apt-get install -y --no-install-recommends glpk-utils

# Update paths (for glpk not sure if needed):
ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}

# Install from requirements.txt file
COPY config/requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

# Start script
CMD cd ${MAIN_PATH} && sh config/run_jupyter.sh
