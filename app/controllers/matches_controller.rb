class MatchesController < ApplicationController
  before_action :authenticate_user!

  def availabilities
    @full_matches = current_user.full_matches(type: 'availabilities') || []
    @partial_matches = current_user.partial_matches(type: 'availabilities') - @full_matches
  end

  def seekings
    @full_matches = current_user.full_matches(type: 'seekings') || []
    @partial_matches = current_user.partial_matches(type: 'seekings') - @full_matches
  end

  def show
  end
end
