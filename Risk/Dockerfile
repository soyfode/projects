FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    python3-pip

RUN pip3 install --upgrade pip

# Instalar solo las bibliotecas requeridas
RUN pip3 install statsmodels numpy plotly matplotlib quandl yfinance pandas datetime fredapi tensorflow yellowbrick imblearn pymc3 arviz scikit-learn gap-stat

# Descargar el modelo en inglés para spacy, si es necesario
# RUN python3 -m spacy download en
# Install the Vim JupyterLab extension
RUN pip3 install jupyterlab_vim

USER $NB_UID

