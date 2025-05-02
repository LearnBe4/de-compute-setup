# About the repo
- This repo is built to facilitate learning of Pyspark.

## Pre-requisites
1. [Install Docker](https://docs.docker.com/desktop/)
2. [Install Python](https://www.python.org/downloads/)

# Build Docker Image
```shell
pip install uv
uv sync
make build  # docker compose build
```

# Running the code (Spark standalone cluster)
You can run the spark standalone cluster by running:
```shell
make run # docker compose up
```
or with 2 workers using:
```shell
make run-scaled # docker compose up --scale worker=2
```

## Web UIs
- The Jupyter Notebook: `localhost:8080`
  - Token: jupyter
- Spark UI: `localhost:4040`
- Spark Master Node: `localhost:9090`
- Spark History Server: `localhost:18080`

