class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :email, :type => String
  field :username, :type => String
  validates :username, :presence => true,
                       :length => {:minimum => 2},
                       :format => { :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces"},
                       :uniqueness => true

  # Virtual login for authenticating via username or email
  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :username => login }, { :email => login }).first
  end

  self.token_authentication_key = "access_token"
  def self.find_for_token_authentication conditions
    find(AccessGrant.where(access_token: conditions[token_authentication_key]).only(:user_id).last.user_id)
  end
    
end
