class UsersController < ApplicationController
  # Authenticating on certain methods
  before_action :authenticate, except: [:create, :login]

# A user signing up
 def create
   puts params
   @first_name = params[:first_name]
   @last_name = params[:last_name]
   @email = params[:email]
   @password = params[:password]
   @user= User.new(:first_name => @firstname, :last_name => @last_name, :email => @email, :password => @password)
   if @user.save
     render status: :created
   else
     render json: @user.errors, status: 422
   end
 end
# A user logging in
 def login
   @user = User.find_for_authentication(:email => params[:email])
   if @user.valid_password?(params[:password]).to_s
     render json: @user, status: :ok
   else
     render status: 401
   end
 end
 # User adding skills to his profile with level of expertise from 1 to 5
 def add_skills
   @skill_id = params[:skill_id]
   @expertise_level= params[:expertise_level]
   @user_skill = UserSkill.new(:user_id => @current_user.id, :skill_id => @skill_id, :expertise_level => @expertise_level)
   if @user_skill.save
    render status: :created
   else
   render json: @user_skill.errors, status: 422
   end
end
# A user seraching for other users with specific skill
def search
  @title = params[:title]
  @skill= Skill.find_by(:title => @title)
  @users = @skill.users
  render json: @users
end
  protected

  # Authenticate the user with the token based authentication
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: 'Bad credentials', status: :unauthorized
  end

end
