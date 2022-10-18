FROM atsrepo.azurecr.io/ruby
RUN apt-get update -qq \
&& apt-get install -y nano curl build-essential libpq-dev \
 nodejs yarn netcat mysql-client &&\
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get clean \
&& rm -f /var/lib/apt/lists/*_*
RUN gem update --system && gem install bundler  
WORKDIR /app
COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install
RUN gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
COPY . /app
COPY docker-entrypoint.sh /usr/local/bin 

EXPOSE 80
RUN bundle exec rails server -e development -b '0.0.0.0' -p 80 &
ENTRYPOINT ["docker-entrypoint.sh"]


