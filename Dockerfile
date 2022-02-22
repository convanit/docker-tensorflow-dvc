FROM tensorflow/tensorflow:2.5.1
RUN apt update
RUN mkdir -p /usr/share/man/man1/

RUN apt install -y openjdk-17-jdk
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt install -y nodejs
RUN apt install -y wget
RUN wget \
       https://dvc.org/deb/dvc.list \
       -O /etc/apt/sources.list.d/dvc.list
RUN wget -qO - https://dvc.org/deb/iterative.asc | apt-key add -
RUN apt update
RUN apt install -y dvc


RUN pip install pandas
RUN pip install pyyaml
RUN pip install numpy scipy scikit-learn
RUN pip install opencv-python
RUN pip install scikit-image
RUN pip install albumentations
RUN pip install seaborn


RUN mkdir /work

RUN mkdir /data
WORKDIR /work/

CMD ["java", "--version"]
