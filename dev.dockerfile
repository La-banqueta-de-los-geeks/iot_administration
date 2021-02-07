FROM ruby:2.7.1

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  yarn

RUN mkdir -p /home/app
WORKDIR /home/app
COPY ./Gemfile ./
COPY ./Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
# Copy the main application.
COPY ./ ./
EXPOSE 3000

CMD [ "rails", "s", "-b", "0.0.0.0"]