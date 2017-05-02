#Include some gems in case we need it
require_relative "../../initializer"
require_relative "kafka_connection"

class PlayerPersona
  #I play games !

  attr_accessor :projects, :interests, :email

  include Connectable

  #I can be configurable !
  # projects:array, interests:array, email:string
  def initialize(args={})
    @projects  = args[:projects] if args[:projects]
    @interests = args[:interests] if args[:interests]
    @email     = args[:email] if args[:email]
  end


  #I can be whoever yo want !!
  def self.become_hardcore_player

  end


  # I play metagame
  def make_a_play(project,interest,count=1)
    send_message(make_message(project,interest,count))
  end

  #We make plays for different projects with differents interests.
  def make_plays(count=1,each=false)
    count.times do
      count = 1 unless each
      make_a_play(@projects.sample,@interests.sample,count)
    end
  end

  def become_citizen_scientist
    #Visitor -> Explorer.
    make_a_play(@projects.first,:login,2)
    #Explorer->Citizen Scientist.
    make_a_play(@projects.first,:contribution,4)
    make_a_play(@projects.first,:reinforcement,4)
    make_a_play(@projects.first,:dissemination,2)
  end

  private

  def make_message(project,interest,count)
    {
      project: project.to_s,
      event: interest.to_s,
      count: count,
      timestamp: Time.now,
      email: @email,
      arguments:[]
    }
  end

end
