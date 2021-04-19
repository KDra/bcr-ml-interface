FROM python:3.9-slim
RUN apt-get update && \
    apt-get install g++ unzip libaio1 zlib1g libsnappy-dev wget python3 python3-dev git curl -y && \
    rm -rf /var/lib/apt/lists/*
RUN pip --no-cache-dir install \
    pandas \
    dagit \
    sqlalchemy \
    cx_Oracle \
    plotly \
    dash==1.19.0 \
    mdmail \
    tensorboard \
    jupyterlab \
    gunicorn \
    pyarrow
WORKDIR /opt/
RUN wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
RUN unzip instantclient-basic-linux.x64-21.1.0.0.0.zip && rm instantclient-basic-linux.x64-21.1.0.0.0.zip
ENV LD_LIBRARY_PATH=/opt/instantclient_21_1/:$LD_LIBRARY_PATH
RUN ldconfig
RUN rm -rf /tmp/* /var/cache/apt/archives /usr/share/doc/ /usr/share/man/ /usr/share/locale/ /usr/local/share/doc/ /usr/local/share/man/
WORKDIR /
CMD ['python', '--version']
