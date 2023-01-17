FROM python:3.7-slim

# install python
RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*
    
COPY requirements.txt .

COPY make_dataset.py .
COPY main.py .
COPY model.py .

COPY corruptmnist .

WORKDIR .
RUN pip install -r requirements.txt --no-cache-dir

ENTRYPOINT ["python3", "-u", "main.py"]
