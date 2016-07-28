require_relative 'jedisith'

describe Jedi do

  context '.new' do

    before :each do
      @jedi = Jedi.new(
        name: 'Leia Organa',
        force_level: 6,
        master: nil,
        origin: 'Alderaan',
        skills: [:fighting, :lightsaber]
      )
    end

    it 'should have a name' do
      expect(@jedi.name).to eq('Leia Organa')
    end

    it 'should have a force_level' do
      expect(@jedi.force_level).to eq(6)
    end

    it 'should have an origin' do
      expect(@jedi.origin).to eq('Alderaan')
    end

    it 'should have skills' do
      expect(@jedi.skills).to eq([:fighting, :lightsaber])
    end

  end

  context 'suffer at the mercy of Yoda' do

    before :each do
      @yoda = Jedi.new(
        name: 'Yoda the Merciless',
        force_level: 11,
        origin: 'Dagobah',
        skills: [:fighting, :lightsaber, :spinning, :levitating, :kicking_ass, :talking_funny]
      )
      @padawan = Jedi.new(name: 'Stupid')
    end

    it 'should find a master' do
      @yoda.mentor(@padawan)
      expect(@padawan.master).to eq(@yoda)
    end

    context 'found a master' do

      before do
        @yoda.mentor(@padawan)
      end

      it 'should get better with practice' do
        @padawan.practice
        expect(@padawan.force_level).to eq(1)
      end

      it 'should receive a skill from master' do
        @padawan.receive_skill
        expect(@padawan.master.skills & @padawan.skills).not_to eq([])
      end

      it 'should receive a specific skill from master' do
        @padawan.receive_skill(:lightsaber)
        expect(@padawan.skills.include?(:lightsaber)).to be true
      end

      it "should raise an exception when master doesn't have the skill" do
        expect { @padawan.receive_skill(:make_blue_milk_milkshake) }.to raise_error(Jedi::MasterError, "master doesn't know how to do that!")
      end

    end

    context 'no master' do

      it 'should get better with practice but NOPE' do
        expect { @padawan.practice }.to raise_error(Jedi::MasterError, "You don't have a master!")
      end

      it 'should receive a skill from master but NOPE' do
        expect { @padawan.receive_skill }.to raise_error(Jedi::MasterError, "You don't have a master!")
      end

    end

  end

end
