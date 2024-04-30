FROM python:3.9
RUN apt-get clean && apt-get update && apt-get install -y \ 
    python3-pip \
    ffmpeg \
    libsm6 \
    libxext6 \
    poppler-utils \
    tesseract-ocr

RUN pip3 install --no-cache-dir jupyterlab \
    && useradd -ms /bin/bash lab

RUN pip3 install -U layoutparser
RUN pip3 install -U layoutparser[ocr] 

RUN pip3 install pytesseract 
RUN pip3 install pdf2image 

# Versions of pytorch and torchvision should be updated in pairs
# See https://github.com/pytorch/vision/ for valid pairings
RUN pip3 install torch==2.2 
RUN pip3 install torchvision==0.17

RUN pip3 install "git+https://github.com/facebookresearch/detectron2.git@v0.6#egg=detectron2"

# OCR libraries
RUN pip3 install paddlepaddle -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install "paddleocr>=2.0.1"

# Need to run this at end to address pillow version bug
RUN pip3 uninstall pillow -y
RUN pip3 install pillow==9.5.0 

USER lab
WORKDIR /home/lab
VOLUME ["/home/lab"]

CMD jupyter lab --ip=0.0.0.0 --no-browser
