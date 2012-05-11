class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	## Database authenticatable
  field :email,              :type => String, :null => false
  field :encrypted_password, :type => String, :null => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  field :authentication_token, :type => String

  ## Invitable
  # field :invitation_token, :type => String

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
