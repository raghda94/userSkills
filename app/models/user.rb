class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :password
  validates :email, :presence => true, :uniqueness => true  




# Assign an API key when creating the User
before_create :generate_api_key
has_many :user_skills


private
  # Generate a unique API key
  def generate_api_key
    token = SecureRandom.base64.tr('+/=', 'Qrt')
    self.api_key = token
  end
end
