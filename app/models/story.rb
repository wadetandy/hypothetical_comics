class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_votable

  before_save do |story|
    story.text = Sanitize.fragment(story.text, Sanitize::Config::RELAXED)
  end

  def vote_percentage
    return nil if count_votes_total == 0

    count_votes_up.to_f / count_votes_total * 100
  end
end
