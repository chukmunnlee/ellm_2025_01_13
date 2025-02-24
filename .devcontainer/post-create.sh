#!/bin/sh

apt update && apt install -y pandoc

START="$(date)"

pip3 install --upgrade pip
#pip3 install -r requirements.txt
pip install chromadb pypandoc
pip install transformers datasets evaluate rouge_score loralib peft 
pip3 install ipykernel ipywidgets 
pip3 install langchain-community sentence-transformers unstructured
 
# Torch with CPU
#pip3 install torch==2.5.1+cpu torchdata --index-url https://download.pytorch.org/whl/cpu
pip3 install torch torchdata
# smolagents will install an incompatible version of torchvision
pip install smolagents

echo "Preloads..."
python3 preload.py


echo "Set HF_TOKEN"
export HF_TOKEN="Your Huggingface token here"

echo "+++ Start time: ${START}"
echo "+++ End time: $(date)"
