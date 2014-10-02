module VotableControllerMixin
  def submit_upvote(model, user)
    vote(model, user, 'up')
  end

  def submit_downvote(model, user)
    vote(model, user, 'down')
  end

  private
  def vote(model, user, direction)
    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["up", "down"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    model.vote_by voter: user, vote: direction
  end
end
