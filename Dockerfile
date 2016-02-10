FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim
RUN npm install -g phantomjs

# Pre-bundle: note that you'll need to rebuild if/when you update the Gemfile
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# We'll be using volumes_from on OSX to mount a data volume
# to address the performance issues associated with mounting
# the OS X file system.
#
# When running on AWS for CI, mount a volume to override this
RUN mkdir -p /usr/src
RUN ln -s /data/proctorserv /usr/src/app

WORKDIR /usr/src/app
COPY ./ ./

# For produciton, RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0"]
