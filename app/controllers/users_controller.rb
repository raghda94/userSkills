class UsersController < ApplicationController
  # Authenticating on certain methods
  before_action :authenticate, except: [:create, :login]


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
 def login
   puts "**************************************************"
   @user = User.find_for_authentication(:email => params[:email])
   if @user.valid_password?(params[:password])
     sign_in(:user,@user)
     render json: @user, status: :ok
   end
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
