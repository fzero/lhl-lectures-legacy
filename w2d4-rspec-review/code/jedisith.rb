class Jedi

  class MasterError < StandardError; end

  attr_reader :name, :force_level, :origin, :skills
  attr_accessor :master

  def initialize(params={})
    @name = params[:name]
    @force_level = params[:force_level] || 0
    @master = params[:master]
    @origin = params[:origin]
    @skills = params[:skills] || []
  end

  def mentor(jedi)
    jedi.master = self
  end

  def practice
    raise MasterError, "You don't have a master!" if @master.nil?
    @force_level += 1
  end

  def receive_skill(skill=nil)
    raise MasterError, "You don't have a master!" if @master.nil?
    if skill
      unless @master.skills.include?(skill)
        raise MasterError, "master doesn't know how to do that!"
      end
      @skills << skill
    else
      @skills << master.skills.sample
    end
  end

end
