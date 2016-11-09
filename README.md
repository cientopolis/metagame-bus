# Metagame-bus

Installation
------------

(Prerequisite: Have installed [Bundler ](http://bundler.io/))

 * Execute: bundle install


Configuration
-------------
  * All the environment variables are in config/application.yml

Usage
-------
  1. Execute: bundle exec application.rb
  2. The application will be running posting each event to ENV["metagame_api"].

Testing
-------

For testing there is an api-test folder.
  1. Execute: bundle exec ruby api-test/app.rb. The api will be running on:
  "http:/localhost:4567"
  2. Execute: bundle exec ruby application.rb  
  3. Execute: bundle exec ruby producer.rb (This will generate a message).
  4. Check the prompt of the API.
