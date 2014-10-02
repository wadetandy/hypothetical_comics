module VotesHelper
  def vote_percentage(item)
    if item.vote_percentage
      "#{number_to_percentage(item.vote_percentage, precision: 0)} (#{item.count_votes_total} Votes)"
    else
      "No Votes Yet"
    end
  end
end
