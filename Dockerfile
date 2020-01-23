# Start from a core stack version
FROM jupyter/datascience-notebook:9f9e5ca8fe5a

# Switch to root user
USER root

# Install glpk (glpsol):
RUN apt-get update && \
    apt-get install -y --no-install-recommends glpk-utils

# Update paths (for glpk not sure if needed):
ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}

# Install from requirements.txt file
# COPY requirements.txt /tmp/
# RUN pip install --requirement /tmp/requirements.txt && \
#    fix-permissions $CONDA_DIR && \
#    fix-permissions /home/$NB_USER
