require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @title = 'Lorem ipsum dolor sit amet'
  end

  context 'validation tests' do
    it 'ensures title presence' do
      category = Category.new(title: '').save
      expect(category).to eq(false)
    end

    it 'should save successfully' do
      category = Category.new(title: @title).save
      expect(category).to eq(true)
    end
  end
end
