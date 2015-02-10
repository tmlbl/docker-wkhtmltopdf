FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

## Install build and QT dependencies

RUN apt-get update
RUN apt-get install -y openssl build-essential xorg \
    libssl-dev libxrender-dev git libqt4-dev qt4-dev-tools

## Clone and build the fork of QT

RUN git clone https://github.com/wkhtmltopdf/qt /opt/qt-fork
WORKDIR /opt/qt-fork

RUN QTDIR=. ./bin/syncqt

RUN yes 2>&1 | ./configure -nomake tools,examples,demos,docs,translations \
    -opensource -prefix "../wkqt"

RUN make -j3 && make install

## Build wkhtmltopdf

RUN git clone https://github.com/wkhtmltopdf/wkhtmltopdf.git /opt/wkhtmltopdf
WORKDIR /opt/wkhtmltopdf

RUN ../wkqt/bin/qmake
RUN make && make install

