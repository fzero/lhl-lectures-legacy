class Person

  MAX_HEIGHT = "3m"
  @@people_created = 0

  attr_accessor :height, :eye_colour,
                :hair_colour, :gender,
                :date_of_birth, :name

  def initialize(options = {})
    defaults = {
      name: nil,
      height: nil,
      eye_colour: nil,
      hair_colour: nil,
      gender: nil,
      date_of_birth: Time.now
    }
    options = defaults.merge(options)

    @name = options[:name]
    @height = options[:height]
    @eye_colour = options[:eye_colour]
    @hair_colour = options[:hair_colour]
    @gender = options[:gender]
    @date_of_birth = options[:date_of_birth]

    @@people_created += 1
  end


  def walk(how_far)
    bananas = 10
    puts "#{@name} walked #{how_far} feet."
  end


  def self.people_created
    @@people_created
  end

end


class Singer < Person

  attr_accessor :style, :albums

  def initialize(options = {})
    defaults = {
      style: nil,
      albums: []
    }
    options = defaults.merge(options)

    @style = options[:style]
    @albums = options[:albums]

    super(options)
  end

  def sing(lyrics)
    puts "#{@name} sung #{lyrics} and the crowd goes wild!"
  end

  def dance
    puts "SHAKE TO THE LEFT, THEN TO THE RIGHT WOO"
  end

end


class SingerSongwriter < Singer

  def initialize(options = {})
    defaults = {
      songs_written: [],
      subjects: []
    }
    options = defaults.merge(options)

    @songs_written = options[:songs_written]
    @subjects = options[:subjects]

    super(options)
  end


  def write_song(subject)

    begin
      # TEST FOR SUBJECT
      unless @subjects.include?(subject)
        raise SongwriterError, "Nah, I don't think so."
      end

      # CODE DOESN'T GET HERE IF ERROR HAPPENS
      puts "#{@name} is writing a song about #{subject}!"
    rescue SongwriterError => error
      puts error.message
    end

    puts "This will execute if everything is ok OR if the error is rescued from."
  end

end


class SongwriterError < StandardError
end


#---

madonna = SingerSongwriter.new(name: "Madonna", subjects: ['sex', 'vogue', 'fashion'])

madonna.write_song("vogue")
madonna.write_song("cats")

