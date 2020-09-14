ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

USER root

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install  && \
    rm -rf google-chrome-stable_current_amd64.deb

# install firefox
RUN  wget -O ~/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64" && \
    tar xjf ~/FirefoxSetup.tar.bz2 -C /opt/ && \
    rm -rf ~/FirefoxSetup.tar.bz2

# add webdrivers folder
ADD webdrivers /
COPY requirements.txt .
# Install Python 3 packages
RUN pip install -r requirements.txt