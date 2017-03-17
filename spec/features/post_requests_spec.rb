require 'rails_helper'

describe 'Post Requests', type: :feature, js: true do
  let(:user){ create :user }

  before(:each) do
    sign_in(user)
  end


  describe 'Creating a Post' do
    specify 'a Post should save' do
      visit '/posts/new'
      fill_in 'Title', with: Faker::Lorem.sentence.titlecase
      expect{ click_button 'Create Post'}.to change{ Post.count }.by(1)
    end

    specify 'a Post should be associated with the user that saved it' do
      visit '/posts/new'
      fill_in 'Title', with: Faker::Lorem.sentence
      click_button 'Create Post'
      Post.last.user.should == user
    end
  end


  describe 'Editing a post' do
    specify 'a Post should update' do
      p = create :post
      p.user = user
      p.save!

      visit "/posts/#{p.to_param}/edit"

      new_title = "A new Titlie"

      fill_in "Title", with: new_title
      click_button 'Update Post'

      p.reload
      p.title.should == new_title
    end
  end
end
