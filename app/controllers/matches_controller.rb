class MatchesController < ApplicationController
#testing features

  def index
    logger.debug"started the index action"
    current_user.load_matches!(2)
    logger.debug"loaded some matches"
    @matches = current_user.matches.order('started_at ASC') if current_user
    logger.debug"we should have some matches"
  end

  def show
  	logger.debug"started show action"
    @match = Match.includes(:players).find_by(id: params[:id])
    logger.debug"defined match"
    @players = @match.players.all.group_by(&:radiant)
    logger.debug"defined players"

  end

end


