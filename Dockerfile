FROM ruby:2.1.9
RUN apt-get update -qq && apt-get install -y nodejs sqlite3
RUN mkdir /trash2treasure
WORKDIR /trash2treasure
COPY Gemfile /trash2treasure/Gemfile
COPY Gemfile.lock /trash2treasure/Gemfile.lock
RUN bundle install
COPY . /trash2treasure

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]