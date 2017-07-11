require_relative "../../initializer"
require_relative "player_persona"

# Generalist Player
# A player who participates in different projects.
generalist = PlayerPersona.new(
  projects:["galaxy-conqueror","spotters","colaboratory"],
  email:Faker::Internet.email,
  interests:[:contribution,:reinforcement,:dissemination])

# Specialist player
# A hardcore player who likes to make contributions.
specialist = PlayerPersona.new(
  projects:["galaxy-conqueror"],
  email:Faker::Internet.email,
  interests:[:contribution])

#Networker player
# A player who like to interact with other players.
networker = PlayerPersona.new(
  projects:["galaxy-conqueror"],
  email:Faker::Internet.email,
  interests:[:reinforcement])

#Disseminator player
# A player who like to share their actions in social media.
disseminator = PlayerPersona.new(
  projects:["galaxy-conqueror"],
  email:Faker::Internet.email,
  interests:[:dissemination])

#Random player
# A player who makes random actions.
random = PlayerPersona.new(
  projects:["galaxy-conqueror","spotters"],
  email:Faker::Internet.email,
  interests:[:reinforcement,:contribution,:dissemination])

#Now we play!
def make_plays(player,count,each=false)
  player.become_citizen_scientist
  player.make_plays(count,each)
end

case ARGV[0]
when "generalist"
  make_plays(generalist,10)
when "specialist"
  make_plays(specialist,100,true)
when "networker"
  make_plays(networker,100,true)
when "disseminator"
  make_plays(disseminator,100,true)
when "random"
  make_plays(random,200)
else
  make_plays(random,200)
end
