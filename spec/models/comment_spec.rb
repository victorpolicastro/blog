require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(name: 'Victor',
                        last_name: 'Policastro',
                        email: 'policastro.victor@gmail.com',
                        password: '123456')
    @post = Post.create(title: 'Lorem ipsum',
                        description: 'Lorem ipsum dolor sit amet',
                        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                        user: @user)
    @body = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ' \
            'dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ' \
            'aliquip ex ea commodo consequat.'
    @bad_body = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ' \
                'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ' \
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ' \
                'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse ' \
                'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' \
                'sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis ' \
                'unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, ' \
                'totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae ' \
                'vitae dicta sunt explicabo.'
  end

  context 'validation tests' do
    it 'ensures body presence' do
      comment = @post.comments.build(user: @user).save
      expect(comment).to eq(false)
    end

    it 'ensures body length' do
      comment = @post.comments.build(body: @bad_body,
                                     user: @user).save
      expect(comment).to eq(false)
    end

    it 'ensures user presence' do
      comment = @post.comments.build(body: @body).save
      expect(comment).to eq(false)
    end

    it 'should save successfully' do
      comment = @post.comments.build(body: @body,
                                     user: @user).save
      expect(comment).to eq(true)
    end
  end
end
