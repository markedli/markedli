class Bookmark
  include Mongoid::Document
  include Mongoid::Timestamps

    field :url, :type => String
    field :title, :type => String
    field :description, :type => String
    field :is_private, :type => Boolean
    field :user_id, :type => Integer

    belongs_to :user

    attr_accessible :url, :title, :description, :tags, :is_private

    validates :url, :presence => true,
                    :length => {:minimum => 2, :message => "must be at least 2 characters long"}

    validates :title, :presence => true,
                      :length => {:minimum => 2, :message => "must be at least 2 characters long"},
                      :length => {:maximum => 255, :message => "must be less than 256 characters long"}

    validates :description, :length => {:maximum => 10000, :message => "must be less than 10001 characters long"}

    validates :user_id, :presence => true

end
