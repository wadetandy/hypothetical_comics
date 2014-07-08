class Story < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  before_save do |story|
    story.text = Sanitize.fragment(story.text, Sanitize::Config::BASIC)
  end
end
