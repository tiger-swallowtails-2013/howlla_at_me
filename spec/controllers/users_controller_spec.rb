require 'spec_helper'

describe UsersController do
  it "renders the sign up form for the new page", :type => :request do
    get :new
    expect(response).to render_template("new")
  end
end