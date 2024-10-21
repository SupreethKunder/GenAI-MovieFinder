FROM python:3.13-slim

RUN useradd --create-home devops
USER devops
WORKDIR /home/devops

ENV VIRTUALENV=/home/devops/venv
RUN python3 -m venv $VIRTUALENV
ENV PATH="$VIRTUALENV/bin:$PATH"

COPY --chown=devops dist/*.whl /tmp/

RUN pip install -U pip \
    && pip install --no-cache-dir -U /tmp/*.whl \
    && rm -rf /tmp/*.whl
