class Bookmark
  include Mongoid::Document
    field :url, :type => String
    field :title, :type => String
    field :description, :type => String
    field :is_private, :type => Boolean
    field :user_id, :type => Integer
    field :timestamp, :type => DateTime

    belongs_to :user

    attr_accessible :url, :title, :description, :tags, :is_private

    validates :url, :presence => true,
                    :length => {:minimum => 2, :message => "must be at least 2 characters long"}

    validates :title, :presence => true,
                      :length => {:minimum => 2, :message => "must be at least 2 characters long"},
                      :length => {:maximum => 255, :message => "must be less than 256 characters long"}

    validates :user_id, :presence => true,
                       :length => {:minimum => 1, :message => "must be at least 1 characters long"}

    validates :timestamp, :presence => true

end
