require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(name: 'Victor',
                        last_name: 'Policastro',
                        email: 'policastro.victor@gmail.com',
                        password: '123456')
    @title = 'Lorem ipsum'
    @bad_title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
    @description = 'Lorem ipsum dolor sit amet'
    @bad_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ' \
                        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ' \
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ' \
                        'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse ' \
                        'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' \
                        'sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis ' \
                        'unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, ' \
                        'totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae ' \
                        'vitae dicta sunt explicabo.'
    @body = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
  end

  context 'validation tests' do
    it 'ensures title presence' do
      post = Post.new(description: @description,
                      body: @body,
                      user: @user).save
      expect(post).to eq(false)
    end

    it 'ensures title length' do
      post = Post.new(title: @bad_title,
                      description: @description,
                      body: @body,
                      user: @user).save
      expect(post).to eq(false)
    end

    it 'ensures description presence' do
      post = Post.new(title: @title,
                      body: @body,
                      user: @user).save
      expect(post).to eq(false)
    end

    it 'ensures description length' do
      post = Post.new(title: @title,
                      description: @bad_description,
                      body: @body,
                      user: @user).save
      expect(post).to eq(false)
    end

    it 'ensures body presence' do
      post = Post.new(title: @title,
                      description: @description,
                      user: @user).save
      expect(post).to eq(false)
    end

    it 'should save successfully' do
      post = Post.new(title: @title,
                      description: @description,
                      body: @body,
                      user: @user).save
      expect(post).to eq(true)
    end
  end
end
