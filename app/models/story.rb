class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_votable

  before_save do |story|
    story.text = Sanitize.fragment(story.text, Sanitize::Config::RELAXED)
  end
end
