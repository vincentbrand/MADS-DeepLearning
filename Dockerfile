FROM ageron/handson-ml3:latest

# Install Python dependencies into the image (baked in)
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm -f /tmp/requirements.txt

EXPOSE 8888

# Local dev: disable token/password
CMD ["bash", "-lc", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_remote_access=True"]