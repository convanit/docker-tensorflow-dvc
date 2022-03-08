ARG TENSORFLOW_VERSION="2.5.1"
FROM tensorflow/tensorflow:${TENSORFLOW_VERSION}


ARG NODEJS_VERSION="16"
ENV NODEJS_VERSION=$NODEJS_VERSION

RUN \
       curl -sqL "https://deb.nodesource.com/setup_${NODEJS_VERSION}.x" | bash - && \
       curl -sqL "https://dvc.org/deb/dvc.list" > /etc/apt/sources.list.d/dvc.list && \
       curl -sqL "https://dvc.org/deb/iterative.asc" | apt-key add - && \
       mkdir -p /usr/share/man/man1; \
       apt update && \
       apt install -y default-jre openjdk-11-jdk nodejs wget dvc &&\
       rm -rf /var/lib/apt/lists/*

RUN pip install pandas \
       pyyaml \
       numpy \
       scipy \
       scikit-learn \
       opencv-python \
       scikit-image \
       albumentations \
       seaborn

RUN mkdir /work /data

WORKDIR /work

CMD ["java", "--version"]
