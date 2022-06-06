# For more information, please refer to https://aka.ms/vscode-docker-python
#FROM python:3.8-slim
FROM python:3.8-slim-buster

EXPOSE 8080

# Keeps Python from generating .pyc files in the container
#ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
#ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install pip requirements
#COPY requirements.txt .
COPY requirements.txt /app/
#RUN python -m pip install -r requirements.txt

RUN pip3 install -r requirements.txt


#COPY . /app
COPY . /app/

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:8080", "ats.wsgi"]
CMD [ "python3" , "manage.py" , "runserver" , "0.0.0.0:8080"]
