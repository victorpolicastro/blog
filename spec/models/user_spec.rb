require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @name = 'User'
    @last_name = 'Policastro'
    @email = 'policastro.user@gmail.com'
    @password = '123456'
  end

  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(last_name: @last_name,
                      email: @email,
                      password: @password).save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new(name: @name,
                      email: @email,
                      password: @password).save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: @name,
                      last_name: @last_name,
                      password: @password).save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(name: @name,
                      last_name: @last_name,
                      email: @email).save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: @name,
                      last_name: @last_name,
                      email: @email,
                      password: @password).save
      expect(user).to eq(true)
    end
  end
end
