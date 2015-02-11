# docker-wkhtmltopdf

WebKit HTML to PDF is a useful utility to convert web pages to PDF documents. This is the easiest way I have found
to generate PDF documents from a web application. Unfortunately, some of the extended features require a patched
version of QT in order to be usable. This is the sort of thing that can be a real DevOps headache but is made rather
trivial through the use of Docker.

This Dockerfile gets the latest source for wkhtmltopdf and its patched version of QT, and compiles them with the
appropriate configuration. To build:

    docker build -t <image_name> .
  
To test:

    docker run <image_name> wkhtmltopdf --version
