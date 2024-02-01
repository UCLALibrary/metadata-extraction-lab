# Metadata Extraction Lab

An experimental repository to demonstrate metadata extraction tools.

This repository is intended as a starting point for experimenting with metadata extraction tools, providing a Dockerfile with a working environment and sample scripts.

## Prerequisites
- Docker installed on local machine

## Instructions

Clone repo to local machine, cd into repo directory:
```
git clone https://github.com/UCLALibrary/metadata-extraction-lab.git
cd metadata-extraction-lab
```
Build the container image:
```
docker build -t metadata-lab:latest .
```
Run a container, mapping ports to expose Jupyter Lab, and mapping the current directory to a Docker Volume for file sharing:
```
docker run -it -p 9999:8888 -v "$(pwd)":/home/lab metadata-lab
```
In your terminal window, take note of the token assigned. It will look something like:
```
lab?token=1c5a66545jksfsdfsdfljk
```
On your local machine, in a web browser, navigate to `localhost:9999`. You will be prompted for the token above.

After approving, you should be able to navigate Jupyter Lab. A sample notebook in the `notebooks` directory contains a demo of the stock [layout-parser](https://layout-parser.github.io/) model.

