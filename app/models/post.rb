class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  attr_accessible :author, :description, :title
end
