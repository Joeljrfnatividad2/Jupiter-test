# Start with an official Jupyter image
FROM jupyter/base-notebook:latest

# Set environment variables to disable Jupyter's token authentication
ENV JUPYTER_TOKEN=''

# Install additional dependencies (if necessary)
RUN pip install --no-cache-dir \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    scipy \
    scikit-learn \
    seaborn \
    && apt-get update \
    && apt-get install -y \
    git \
    curl \
    && apt-get clean

# Expose the Jupyter port
EXPOSE 8888

# Start JupyterLab
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
