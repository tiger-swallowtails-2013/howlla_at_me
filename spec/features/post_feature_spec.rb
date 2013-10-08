require 'spec_helper'

feature Post do
  scenario "may be created by guest" do
    visit '/posts/new'

    fill_in 'Title', :with => 'title'
    fill_in 'Description', :with => 'My post description'

    expect {
      click_on 'Create Post'
    }.to change { Post.count }.by 1
  end
end