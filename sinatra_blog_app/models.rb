class Post < ActiveRecord::Base
  validates_presence_of :title
end

class User < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :password, :maxmum => 10, :minimum => 4
end
