require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_1) { User.create(name: 'aaron ro') }

  describe 'test for presence of model attributes for' do
    describe 'general expected attributes' do
      it 'should include the :name attribute' do
        expect(user_1.attributes).to include('name')
      end
    end
  end

  describe 'Basic validations' do
    context 'name' do
      it 'is valid with a name' do
        user_1.valid?
        expect(user_1.errors[:name]).to_not include("can't be blank")
      end

      it 'is valid if length is less than 3 characters' do
        user_1.valid?
        expect(user_1.errors[:name]).to_not include('is too long (maximum is 40 characters)')
      end

      it 'is invalid if length is more than 40 characters' do
        user_1.name = 'a' * 46
        user_1.valid?
        expect(user_1.errors[:name]).to include('is too long (maximum is 40 characters)')
      end

      it 'is invalid without a name' do
        user_1.name = nil
        user_1.valid?
        expect(user_1.errors[:name]).to include("can't be blank")
      end
    end
  end

  describe 'Devise specific attributes' do
    it 'should include the :encrypted_password attribute' do
      expect(user_1.attributes).to include('encrypted_password')
    end

    it 'should include the :reset_password_sent_at attribute' do
      expect(user_1.attributes).to include('reset_password_sent_at')
    end

    it 'should include the :reset_password_token attribute' do
      expect(user_1.attributes).to include('reset_password_token')
    end

    it 'should include the :remember_created_at attribute' do
      expect(user_1.attributes).to include('remember_created_at')
    end
  end

  describe 'Associations' do
    context 'articles' do
      it 'has correct has_many association' do
        t = User.reflect_on_association(:articles)
        expect(t.macro).to eq(:has_many)
      end
    end

    context 'comments' do
      it 'has correct has_many association' do
        t = User.reflect_on_association(:comments)
        expect(t.macro).to eq(:has_many)
      end
    end

    context 'votes' do
      it 'has correct has_many association' do
        t = User.reflect_on_association(:votes)
        expect(t.macro).to eq(:has_many)
      end
    end
  end
end
