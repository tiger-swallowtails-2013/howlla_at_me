require 'spec_helper'

describe Post, :type => :request do
  it "may be created with title and description" do
    expect {
      post '/posts', {
        :title       => 'Post title',
        :description => 'Post description'
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
end