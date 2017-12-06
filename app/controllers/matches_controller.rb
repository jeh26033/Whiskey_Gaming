class MatchesController < ApplicationController
#testing features

  def index
    @matches = current_user.matches.order('started_at DESC') if current_user
  end

  def show
    @match = Match.includes(:players).find_by(id: params[:id])
    @players = @match.players.order('slot ASC').group_by(&:radiant)
  end
end


