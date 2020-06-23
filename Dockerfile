ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

USER root

# install last mariadb C connector https://mariadb.com/kb/en/mariadb-package-repository-setup-and-usage/
RUN apt update && \
    apt install -y curl && \
    curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash && \
    apt update && \
    apt install -y libmariadb-dev

#USER $NB_UID

# Install Python 3 packages
RUN pip install mariadb wikipedia beautifulsoup4 scrapy google-cloud-bigquery mysql.connector nltk