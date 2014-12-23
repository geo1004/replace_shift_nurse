class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @full_matches = current_user.full_matches || []
    @partial_matches = current_user.partial_matches - @full_matches
  end

  def show
  end
end
