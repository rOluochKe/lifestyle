require 'rails_helper'
require_relative '../support/association'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: 'aaron rory') }
  let(:article1) { Article.create(user_id: user.id, content: 'valid test article') }

  describe 'test for presence of model attributes for' do
    describe 'general expected attributes' do
      it 'should include the :content attribute' do
        expect(article1.attributes).to include('content')
      end
      it 'should include the :image attribute' do
        expect(article1.attributes).to include('image')
      end
    end
  end

  describe 'Basic validations' do
    context 'content' do
      it 'is valid if length is less than 800 characters' do
        article1.valid?
        expect(article1.errors[:content]).to_not include('is too long (maximum is 1000 characters)')
      end

      it 'is invalid if length is more than 1000 characters' do
        article1.content = 'a' * 1002
        article1.valid?
        expect(article1.errors[:content]).to include('is too long (maximum is 1000 characters)')
      end

      it 'is invalid if length is less than 3 characters' do
        article1.content = 'te'
        article1.valid?
        expect(article1.errors[:content]).to include('is too short (minimum is 3 characters)')
      end
    end
  end

  describe 'Associations' do
    context 'users' do
      it 'has correct has_many association' do
        expect(Article).to belong_to(:user)
      end
    end

    context 'comments' do
      it 'has correct has_many association' do
        expect(Article).to have_many(:comments)
      end
    end

    context 'votes' do
      it 'has correct has_many association' do
        expect(Article).to have_many(:votes)
      end
    end
  end
end
