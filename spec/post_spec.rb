require 'spec_helper'

describe Post, :type => :request do
  it "may be created with title and description" do
    expect {
      post '/posts', {
        post: {
          :title       => 'Post title',
          :description => 'Post description'
        }
      }
    }.to change { Post.count }.by 1
  end

  it "may not be created with a blank title" do
    expect {
      post '/posts', {
        :description => 'Post description'
      }
    }.not_to change { Post.count }
  end

  it "may not be created with a blank description" do
    expect {
      post '/posts', {
        :title => 'Post title'
      }
    }.not_to change { Post.count }
  end

  it "new post page may be seen by a guest" do
    get '/posts/new'
    expect(response).to render_template(:new)
    expect(response.body).to match(/New Post/i)
  end
end

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