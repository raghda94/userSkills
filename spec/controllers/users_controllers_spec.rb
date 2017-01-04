require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "register" do
    it "creates a new user" do
      post :create,{:first_name => "Raghda",:last_name => "Khaled", :email => "Raghdasoltan1994@gmail.com",
      :password => "12345678" }
      # test for returning status Code
      expect(response).to be_success
    end
  end
  describe "login" do
    it "logs in a user" do
      User.create(:email => "rana@gmail.com", :password => "rana12345678")
      post :login,{:email => "rana@gmail.com", :password => "rana12345678"}
      expect(response).to be_success
    end
  end
end
