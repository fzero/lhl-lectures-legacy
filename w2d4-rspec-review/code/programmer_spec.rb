require_relative 'programmer.rb'

describe Programmer do

  context '.new' do

    before :each do
      @programmer = Programmer.new(
        name: 'Ned Stark',
        languages: {ruby: 8, javascript: 5, python: 4},
        years_of_experience: 4,
        city: 'Toronto'
      )
    end

    it 'should have a name' do
      expect(@programmer.name).to eq('Ned Stark')
    end

    it 'should have languages' do
      expect(@programmer.languages).to eq({ruby: 8, javascript: 5, python: 4})
    end

    it 'should have years of experience' do
      expect(@programmer.years_of_experience).to eq(4)
    end

    it 'should have a city' do
      expect(@programmer.city).to eq('Toronto')
    end

  end


  context 'Training' do

    before :each do
      @programmer = Programmer.new
    end

    it 'should be able to learn a new language' do
      @programmer.learn_language('Ruby')
      expect(@programmer.languages).to eq({ruby: 1})
    end

    it 'should not overwrite an existing language' do
      @knows_ruby = Programmer.new(languages: {ruby: 5})
      @knows_ruby.learn_language('Ruby')
      expect(@knows_ruby.languages).to eq({ruby: 5})
    end

    it 'should increase skills on a language through practice' do
      @programmer.learn_language(:python)
      expect(@programmer.languages).to eq({python: 1})
      @programmer.practice_language(:python)
      expect(@programmer.languages).to eq({python: 2})
    end

    it "should raise an error when practicing a language they don't know yet" do
      expect { @programmer.practice_language(:python) }.to raise_error(Programmer::ProgrammerError, "I don't know python yet!")
    end

  end

end
