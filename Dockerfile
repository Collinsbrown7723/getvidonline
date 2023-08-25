FROM python:3.8

COPY requirements.txt

RUN pip install --nocache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD["python","getvidonline.py"]