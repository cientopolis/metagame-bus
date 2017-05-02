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
  1. Execute: bundle exec ruby application.rb
  2. The application will be running posting each event to ENV["METAGAME_API"].

Testing
-------

For testing there inside the test folder you can find:
- mock-api: A Sinatra API to check te conectivity of this bus.
- mock-producer: A mock-player which makes actions in the Metagame.
