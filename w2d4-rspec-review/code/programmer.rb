class Programmer

  class ProgrammerError < StandardError
  end

  attr_reader :name, :languages, :years_of_experience, :city

  def initialize(params={})
    @name = params[:name]
    @languages = params[:languages] || {}
    @years_of_experience = params[:years_of_experience]
    @city = params[:city]
  end

  def learn_language(lang)
    normalized_lang = lang.downcase.to_sym
    if @languages[normalized_lang].nil?
      @languages[normalized_lang] = 1
    end
  end

  def practice_language(lang)
    normalized_lang = lang.downcase.to_sym
    raise ProgrammerError, "I don't know #{lang} yet!" if @languages[normalized_lang].nil?
    @languages[normalized_lang] += 1
  end

end
