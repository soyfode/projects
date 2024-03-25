FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    python3-pip

RUN pip3 install --upgrade pip

RUN pip3 install scikit-learn spacy torch pyspark pandas numpy plot_classifier

RUN python3 -m spacy download en

USER $NB_UID

