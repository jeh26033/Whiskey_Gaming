class MatchesController < ApplicationController


	
@matchlist = []
    if session.key? :current_user
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{session[:current_user][:uid]}")
      res = Net::HTTP::get(url)
      @matchlist = JSON.load(res)['result']['matches'] || []
    end
  

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nickname => auth.info['nickname'],
                                          :image => auth.info['image'],
                                          :uid => auth.uid }
    redirect_to root_url
  end
end
