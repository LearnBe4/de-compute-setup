# About the repo
You can use this to run a spark standalone cluster with a jupyter notebook.

# Requirements
- Docker
- Docker Compose
- Make
- Python3
- Pip3
- Jupyter Notebook
- Spark


# Running the code (Spark standalone cluster)
You can run the spark standalone cluster by running:
```shell
make run
```
or with 2 workers using:
```shell
make run-scaled
```

There are a number of commands to build the standalone cluster,
you should check the Makefile to see them all. But the
simplest one is:
```shell
make build
```

## Web UIs
- The Jupyter Notebook: `localhost:8080`
  - Token: jupyter
- Spark Master Node: `localhost:9090`
- Spark UI: `localhost:4040`
- Spark History Server: `localhost:18080`
- ResourceManager: `localhost:8088`

