FROM debian:bookworm-slim AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        build-essential \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone --depth 1 https://github.com/eprover/eprover.git

WORKDIR /opt/eprover
RUN ./configure && make

FROM python:3.12-slim

COPY --from=build /opt/eprover/PROVER/eprover /usr/local/bin/eprover

ENV ATP_EPROVER_BIN=eprover

WORKDIR /app
COPY proover_demo.py .

ENTRYPOINT ["python", "proover_demo.py"]
