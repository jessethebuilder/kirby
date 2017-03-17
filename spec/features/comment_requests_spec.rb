require 'rails_helper'

describe 'Comment Requests', type: :feature, js: true do
  let!(:post){ create :post }
  let(:user){ create :user }

  before(:each) do
    sign_in(user)
    visit "/posts/#{post.to_param}"
    click_link 'Add'

    fill_in 'comment_body', with: Faker::Lorem.sentences.join('. ')
  end

  describe 'Creating a Comment' do
    specify "Can create" do
      expect{ click_button "Create Comment" }.to change{ Comment.count }.by(1)
    end

    specify 'Associates comment to user' do
      click_button "Create Comment"
      Comment.last.user.should == user
    end

    specify "Associates comment to post" do
      click_button "Create Comment"
      Comment.last.post.should == post
    end
  end
end
