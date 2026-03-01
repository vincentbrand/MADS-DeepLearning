FROM ageron/handson-ml3:latest

USER root

COPY requirements.txt /opt/requirements.txt
RUN /opt/conda/envs/homl3/bin/pip install --no-cache-dir -r /opt/requirements.txt \
 && rm -f /opt/requirements.txt

# optional: drop back to a non-root user if the image has one
# (safe to omit; compose runs the command regardless)
USER devel

EXPOSE 8888