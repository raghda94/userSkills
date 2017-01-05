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
      User.create(:email => "rowan@gmail.com", :password => "rowanrowan")
      post :login,{:email => "rowan@gmail.com", :password => "rowanrowan"},format: :json
      expect(response.body["api_key"]).not_to be_blank
    end
  end
  describe "can add skills" do
     it "adds skills to a user's profile" do
       @user= User.create(:email => "raghda@gmail.com", :password => "raghda1994K")
       @request.headers[:Authorization] = "Token token=#{@user.api_key}"
       @skill= Skill.create(:title => "programming", :expertise_level => 4)
       post :add_skills, {:skill_id => @skill.id, :user_id => @user.id}
       expect(response.status).to eq(201)
     end
  end
  describe "search" do
    it "searches for users with specific skills" do
      @user= User.create(:email => "raghda@gmail.com", :password => "raghda1994K")
      @request.headers[:Authorization] = "Token token=#{@user.api_key}"
      @skill= Skill.create(:title => "programming", :expertise_level => 4)
      get :search, {:title => @skill.title}
      expect(response).to be_success
    end
  end
end
