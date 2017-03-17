require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u){ build :user }

  describe 'Validations' do
    it{ should validate_presence_of :first_name }
  end

  describe 'Associations' do
    it{ should have_many :posts }
    it{ should have_many :comments }
  end

  describe 'Methods' do
    describe ':name' do
      it 'should return first and last name, if available' do
        u.first_name = "first"
        u.last_name = "last"
        u.name.should == "first last"
      end

      it 'should return only first name if given, with no trailing space' do
        u.name.should == u.first_name
      end
    end
  end
end
