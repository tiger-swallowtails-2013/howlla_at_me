require 'spec_helper'

describe UsersController do
  it "renders the sign up form for the new page", :type => :request do
    get :new
    expect(response).to render_template("new")
  end

  it "creates user when sign up form is submitted" do
    expect {
      post :create, {
        :first_name => 'First name',
        :last_name  => 'Last name',
        :email      => 'email@example.com',
        :password   => 'password',
      }
    }.to change(User, :count).by(1)
  end

  context "Guest", :type => :request do
    it "can see create new post link" do
      get '/'
      expect(response).to render_template(:show)
      expect(response.body).to match(/New Post/)
    end
  end
end