class AccessGrant
  include Mongoid::Document
  belongs_to :user
  belongs_to :client_application
  field :code, type: String
  field :access_token, type: String

  before_create :generate_tokens

  def self.authorize client_application, code
    where(client_application_id: client_application.id).and(code: code).last
  end

  protected 
    def generate_tokens
      self.code, self.access_token = SecureRandom.hex(16), SecureRandom.hex(16)
    end
end
