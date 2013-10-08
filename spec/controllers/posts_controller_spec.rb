require 'spec_helper'

describe PostsController do
  render_views
  it "may be created with title and description" do
    expect {
      post :create, {
        post: {
          :title       => 'Post title',
          :description => 'Post description'
        }
      }
    }.to change { Post.count }.by 1
  end

  it "may not be created with a blank title" do
    expect {
      post :create, {
        :description => 'Post description'
      }
    }.not_to change { Post.count }
  end

  it "may not be created with a blank description" do
    expect {
      post :create, {
        :title => 'Post title'
      }
    }.not_to change { Post.count }
  end

  it "new post page may be seen by a guest" do
    get :new
    expect(response).to render_template(:new)
    expect(response.body).to match(/New Post/i)
  end
end