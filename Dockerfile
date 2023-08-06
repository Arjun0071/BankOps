From python:3.6.8

WORKDIR /root/forum                     # Add your directory of your django project

COPY requirements.txt .

RUN python3 -m venv venv
RUN /root/forum/venv/bin/pip install --upgrade pip
ENV PATH="/root/forum/venv/bin:$PATH"

RUN . /root/forum/venv/bin/activate

RUN /root/forum/venv/bin/pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["/root/forum/venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
