FROM python:3.8.9-alpine3.13
WORKDIR /app
RUN apk update && apk add --update gcc libc-dev  
COPY . .
RUN pip3 install --target=/app -r requirements.txt 

FROM python:3.8.9-alpine3.13
WORKDIR /app
RUN apk update && apk add libusb-dev
COPY --from=pythonBuilder   /app .
CMD ["python3","run.py"]

 
