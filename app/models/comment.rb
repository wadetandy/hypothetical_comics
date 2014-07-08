class Comment < ActiveRecord::Base
  belongs_to :user
  acts_as_votable 
end
