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

RUN pip3 install --upgrade jupyter ipywidgets

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

# Amazon ReFinED related libraries for NER
RUN pip3 install https://github.com/amazon-science/ReFinED/archive/refs/tags/V1.zip

# Need to run this at end to address pillow version bug
RUN pip3 uninstall pillow -y
RUN pip3 install pillow==9.5.0 

# OpenAI for full record creation
RUN pip3 install openai
RUN pip3 install llama-index-llms-ollama

USER lab
WORKDIR /home/lab
VOLUME ["/home/lab"]

# Create initial ReFinED  to frontload caching of models
RUN python -c "print('hello')"
RUN python -c "from refined.inference.processor import Refined; Refined.from_pretrained(model_name='wikipedia_model',entity_set='wikipedia', use_precomputed_descriptions=False, download_files=True)"


CMD jupyter lab --ip=0.0.0.0 --no-browser --ContentsManager.allow_hidden=True
