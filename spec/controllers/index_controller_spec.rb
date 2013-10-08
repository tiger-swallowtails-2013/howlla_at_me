require 'spec_helper'

FactoryGirl.define do
  factory :post do
    title "Diz iz my titlez"
    description "Post description"
  end
end

describe IndexController, :type => :request do
  render_views

  let (:post1) { FactoryGirl.create(:post) }
  let (:post2) { FactoryGirl.create(:post, {:title => "different"}) }

  context "Accessing the home page" do

    it "displays a list of posts including the most recent post" do
      get :show
      expect(response).to render_template("show")
    end

    it "displays list of posts in descending order" do
      post1
      post2
      get :show
      expect(response.body).to match(/different.*Diz/m)
    end
  end
end
