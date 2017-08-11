# Metagame-BusListener

This is a bridge between the Cientopolis Kafka architecture and the Metagame-API.
The idea is to take all the events coming from the Kafka bus (Exactly from the 'metagame' topik) and send it to the Metagame-API.

## Prerequisites
You will need the following to be installed:

* Ruby language (2.3)
* Bundler (http://bundler.io/)
* Kafka installed and running

## Installation

 (In case you have installed Apache Kafka, ignore the first step)
 1. If you don't have Apache Kafka installed there is a file called kafka.sh. You can also change the version inside the script. To install it run:

  ```
  $ sudo ./kafka.sh

  ```

 2. Move to the metagame-bus main folder and execute:
  ```
   $ bundle install

  ```
## Configuration

  * All the environment variables should be in config/application.yml
  * Create a new file called application.yml inside the config/ folder following the application_example.yml as example.

## Usage
  1. Execute: bundle exec ruby application.rb
  2. The application will be running posting each event to ENV["METAGAME_API"].

## Testing

For testing there inside the test folder you can find:
- mock-api: A Sinatra API to check te conectivity of this bus.
- mock-producer: A mock-player which makes actions in the Metagame.

### The PlayerPersona

You can simulate the behavior of a Player generating events to the Kafka cluster and check it in MetagameAPI.
In order to do it, inside the test/mock-producer folder there is a script called: "producer.rb".

The params the script accepts are: "generalist" / "specialist" / "networker" / "disseminator" / "random"

Example of usage:
 - ruby producer.rb "generalist"

So far, this will generate a lot of events to the Kafka cluster, creating a new player with a "Generalist" profile inside the game.
