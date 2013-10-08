require 'spec_helper'

FactoryGirl.define do
  factory :post do
    title "Diz iz my titlez"
    description "Post description"
  end
end

describe 'Index', :type => :request  do

  let (:post1) { FactoryGirl.create(:post) }
  let (:post2) { FactoryGirl.create(:post, {:title => "different"}) }

  context "on vititing the home page" do

    it "displays a list of posts including the most recent post" do
      post1
      get '/'
      expect(response.body).to match('Diz iz my titlez')
    end

    it "displays list of posts in descending order" do
      post1
      post2
      get '/'
      expect(response.body).to match(/different.*Diz/m)
    end
  end
end
