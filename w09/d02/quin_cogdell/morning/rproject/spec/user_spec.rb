require_relative '../lib/user'

describe User do

  # context is for setting up initial conditions
  # one use case of describe is for describing various methods that the class has

  context 'provide basic user info when asked' do
    # before(:each) do
    #   @user = User.new(gender: 'm', first_name: 'Quin', last_name: 'Cogdell', age:'26', married: false )
    # end

    let(:user) do
      User.new(gender: 'm', first_name: 'Quin', last_name: 'Cogdell', age:'26', married: false )`
    end

    it "provides user's gender when asked" do
      expect(user.ge
        nder).to eq('m')
    end

    it "provides user's first_name when asked" do
      expect(user.first_name).to eq('Quin')
    end

    it "provides user's last_name when asked" do
      expect(user.last_name).to eq('Cogdell')
    end

    it "provides martial status when asked" do
      expect(user.married?).to eq(false)
    end
  end

  describe '#abilities' do

    let(:user) do
      User.new
    end

    it 'returns abilities you can do in life' do
      expect(user).to respond_to(:abilities)
    end

    it 'returns abilities you can do in life' do
      user.age = 16
      expect(user.abilities).to eq([:drive])
    end

    it 'returns abilities you can do in life' do
      user.age = 18
      expect(user.abilities).to eq([:drive, :vote])
    end

    it 'returns abilities you can do in life' do
      user.age = 25
      expect(user.abilities).to eq([:drive, :vote, :rent_car])
    end

    it 'returns abilities you can do in life' do
      user.age = 35
      expect(user.abilities).to eq([:drive, :vote, :rent_car, :president])
    end
  end

  describe '#formal_name'

    context 'provide formal names for females' do

      # Change this to a let
      before(:each) do
        @user = User.new(first_name: 'Sally', last_name: 'Smith', gender: 'f')
      end

      it 'provides Mrs. FULL NAME when the person is married and over 20' do
        @user.age = 20
        @user.married = true
        expect(@user.formal_name).to eq('Mrs. Sally Smith')
      end

      it 'should provide a formal name for a female over 20 and not married' do
        @user.age = 20
        expect(@user.formal_name).to eq('Ms. Sally Smith')
      end

      it 'should provide a formal name for a female under 20 and not married ' do
        @user.age = 19
        expect(@user.formal_name).to eq('Sally Smith')
      end
    end

    context 'provide formal names for males' do
      before(:each) do
        @user = User.new(first_name: 'Quin', last_name: 'Cogdell', gender: 'm')
      end

      it 'should provide a formal name for a male over 20 and married' do
        @user.age = 20
        @user.married = true
        expect(@user.formal_name).to eq('Mr. Quin Cogdell')
      end

      it 'should provide a formal name for a male over 20 and not married' do
        @user.age = 20
        expect(@user.formal_name).to eq('Mr. Quin Cogdell')
      end

      it 'should provide a formal name for a male under 20 and not married ' do
        @user.age = 19
        expect(@user.formal_name).to eq('Quin Cogdell')
      end
    enddo

  end

end
