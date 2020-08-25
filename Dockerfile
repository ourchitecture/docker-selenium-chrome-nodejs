FROM selenium/node-chrome

USER root

RUN apt-get update \
  && apt-get -qqy --no-install-recommends install build-essential libssl-dev curl gcc g++ make

# Using Debian, as root
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -qqy --no-install-recommends nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get -qqy --no-install-recommends install yarn

USER 1200

