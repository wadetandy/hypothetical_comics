class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  has_many :children, class_name: 'Comment'
  belongs_to :comment
  acts_as_votable

  validates_presence_of :text, :user, :story
end
