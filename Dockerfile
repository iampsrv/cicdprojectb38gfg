# FROM python:3.14.0a2-alpine3.21
# base image (minimal os image with python installed)
FROM python:3.14.0a2-alpine3.21
# copy all the files from current directory to /application folder in the container
COPY . /application
# set the working directory to /application
WORKDIR /application
# COPY requirements.txt .
# install the dependencies
RUN pip install -r requirements.txt
# expose the port 8080
EXPOSE 8080
# command to run the application
CMD ["python", "app.py"]