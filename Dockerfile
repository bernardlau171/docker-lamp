FROM mysql:latest
COPY setup.sh /mysql/setup.sh
COPY setup.sql /mysql/setup.sql
RUN /mysql/setup.sh
