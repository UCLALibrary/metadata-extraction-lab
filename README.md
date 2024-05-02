# Metadata Extraction Lab

An experimental repository to demonstrate metadata extraction tools.

This repository is intended as a starting point for experimenting with metadata extraction tools, providing a Dockerfile with a working environment and sample scripts.

This is primarily indended for experimentation and inference across a variety of underlying architectures, using only CPU when possible rather than CUDA/GPU specific options.

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
Run a container, mapping ports to expose JupyterLab, and mapping the current directory to a Docker Volume for file sharing:
```
docker run -it -p 9999:8888 -v "$(pwd)":/home/lab metadata-lab
```
In your terminal window, take note of the token assigned. It will look something like:
```
lab?token=1c5a66545jksfsdfsdfljk
```
In a web browser, navigate to [localhost:9999](http://localhost:9999). You will be prompted for the token above.

After approving, you should be able to navigate JupyterLab. A sample notebook in the `notebooks` directory contains a demo of the stock [layout-parser](https://layout-parser.github.io/) model as a starting point, along with several other tools.

Example notebooks:
- [Layout Parser](https://layout-parser.github.io/)
- [Detectron2 : Object Detection and Instance Segmentation](https://github.com/facebookresearch/detectron2)
- [Amazon Science ReFinED NER](https://github.com/amazon-science/ReFinED)
- [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR)

