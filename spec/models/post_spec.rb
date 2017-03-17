require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:p){ build :post }

  describe 'Validations' do
    it{ should validate_presence_of :title }
  end

  describe 'Associations' do
    it{ should belong_to :user }
    it{ should have_many :comments }
  end

  describe 'Methods' do

  end
end
