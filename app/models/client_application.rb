
class ClientApplication
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :key, :type => String
  field :secret, :type => String

  before_create :generate_keys

  validates :name, :presence => true,
    :length => {:minimum => 2}

  attr_accessible :name, :description

  def self.with_id client_id
    where(key: client_id).last
  end

  def self.authorize client_id, client_secret
    where(key: client_id).and(secret: client_secret).last
  end

  protected
    
    def generate_keys
      self.key = SecureRandom.base64(40).gsub(/\W/, '')[0,40]
      self.secret = SecureRandom.base64(40).gsub(/\W/, '')[0,40]
    end

end
