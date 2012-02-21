class Bookmark
    include Mongoid::Document
    field :url, :type => String
    field :title, :type => String
    field :description, :type => String
    field :tags, :type => Array
    field :privacy, :type => String
    field :userID, :type => String
    field :timestamp, :type => Time

    validates :url, :presence => true,
                    :length => {:minimum => 2}

    validates :title, :presence => true,
                      :length => {:minimum => 2}

    validates :userID, :presence => true,
                       :length => {:minimum => 2},
                       :format => { :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces"}

    validates :timestamp, :presence => true

end
