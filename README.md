# About the repo
- This repo is built to faciliate learning of Pyspark.

# Running the code (Spark standalone cluster)
You can run the spark standalone cluster by running:
```shell
make run
```
or with 3 workers using:
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

Download Datasets from google drive: https://drive.google.com/drive/folders/1H-TR3KH_8JqWYzKxsFHEnKoby7A7wdoZ?usp=sharing

## Setting Up Docker Environment

Set up a Docker container with Jupyter, check the container status and get the token/URL.

### Step 1: Run the Docker container with Jupyter
```sh
make run -d
```

### Step 2: Check the status of the Docker container
```sh
docker ps -f name=jupyter_lab
```

### Step 3: Get the Jupyter token/URL
```sh
docker logs jupyter_lab 2>&1 | grep -o 'http://127.0.0.1:8888/?token=jupyter'
```

## Configure VSCode Extensions

Install and configure necessary VSCode extensions: Docker, Remote-Containers, and Jupyter.

### Step 4: Install Python extensions in VSCode
Open the Extensions view (Ctrl+Shift+X), search for "Python" and install it.

### Step 5: Install the Docker extension in VSCode
Open the Extensions view (Ctrl+Shift+X), search for "Docker" and install it.

### Step 6: Install the Dev Containers extension in VSCode
Open the Extensions view (Ctrl+Shift+X), search for "Dev Containers" and install it.

### Step 7: Install the Jupyter extension in VSCode
Open the Extensions view (Ctrl+Shift+X), search for "Jupyter" and install it.

### Step 8: Configure the Dev Containers extension
Open the Command Palette (Ctrl+Shift+P), search for "Dev Containers: Attach to Running Container..." and select the jupyter_container.

### Step 9: Open the Jupyter notebook in VSCode
Once attached to the container, open the Command Palette (Ctrl+Shift+P), search for "Jupyter: Create New Blank Notebook" or open an existing notebook file.

## Connect VSCode to Docker Container

Configure connection settings in VSCode to connect to the Jupyter server running in Docker.

### Step 10: Configure Jupyter server connection in VSCode
Open the Command Palette (Ctrl+Shift+P), search for "Jupyter: Specify Jupyter server for connections" and select it.

### Step 11: Enter the Jupyter server URL
Copy the URL obtained from Step 3 and paste it when prompted in VSCode.

### Step 12: Verify the connection
Open a Jupyter notebook in VSCode and ensure it connects to the Jupyter server running in the Docker container.

## Test Jupyter Connection

Create a test notebook and verify the kernel connection is working properly.

### Step 13: Create a test notebook and verify the kernel connection is working properly

#### Import necessary libraries
```python
import numpy as np
import pandas as pd
```

#### Create a simple DataFrame
```python
data = {
    'A': np.random.rand(5),
    'B': np.random.rand(5),
    'C': np.random.rand(5)
}
df = pd.DataFrame(data)
```

#### Display the DataFrame
```python
df
```

#### Perform a simple calculation
```python
df['D'] = df['A'] + df['B']
```

#### Display the updated DataFrame
```python
df
```

## Working with Notebooks in VSCode

Demonstrate basic notebook operations in VSCode including running cells and managing kernels.

### Step 14: Run all cells in the notebook
In VSCode, you can run all cells by clicking on the "Run All" button at the top of the notebook interface.

### Step 15: Add a new cell and perform a basic operation
Create a new cell below this one and add the following code to perform a basic operation.

#### Calculate the mean of column 'D'
```python
mean_D = df['D'].mean()
```

#### Display the mean value
```python
mean_D
```

### Step 16: Change the kernel
In VSCode, you can change the kernel by clicking on the kernel name at the top right of the notebook interface and selecting a different kernel from the dropdown menu.

### Step 17: Save the notebook
Save the notebook by clicking on the "Save" button or using the shortcut (Ctrl+S).

### Step 18: Close the notebook
Close the notebook by clicking on the "Close" button or using the shortcut (Ctrl+W).

## Troubleshooting Common Issues

Address common connection issues, port conflicts, and kernel problems.

### Step 19: Troubleshooting Common Issues

#### Issue 1: Docker container not starting
Solution: Check if the Docker service is running and restart it if necessary.
```sh
!sudo systemctl status docker
!sudo systemctl restart docker
```

#### Issue 2: Port 8888 already in use
Solution: Find and stop the process using port 8888, or run the Jupyter container on a different port.
```sh
!sudo lsof -i :8888
!sudo kill -9 $(sudo lsof -t -i :8888)
# Alternatively, run the container on a different port, e.g., 8889
# !docker run -d -p 8889:8888 --name jupyter_container jupyter/base-notebook
```

#### Issue 3: Jupyter server not accessible from VSCode
Solution: Ensure the Docker container is running and the correct URL is used in VSCode.
```sh
!docker ps -f name=jupyter_lab
!docker logs jupyter_lab 2>&1 | grep -o 'http://127.0.0.1:8888/?token=[a-z0-9]*'
```

#### Issue 4: Kernel not connecting
Solution: Restart the Jupyter server and reconnect the kernel in VSCode.
```sh
!docker restart jupyter_lab
# In VSCode, click on the kernel name at the top right of the notebook interface and select "Restart Kernel".
```

#### Issue 5: VSCode extensions not working
Solution: Ensure all necessary extensions (Docker, Remote - Containers, Jupyter) are installed and up to date.
Open the Extensions view (Ctrl+Shift+X) and check for updates.

#### Issue 6: Permission denied errors
Solution: Ensure you have the necessary permissions to run Docker commands and access the Jupyter server.
You may need to add your user to the Docker group:
```sh
!sudo usermod -aG docker $USER
# Then log out and log back in for the changes to take effect.
```

#### Issue 7: Network issues
Solution: Check your network connection and firewall settings to ensure they are not blocking the connection.
```sh
!ping -c 4 google.com
```