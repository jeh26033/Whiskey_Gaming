class MatchesController < ApplicationController
#testing features
  def show
    require 'net/http'
    serverIp = "https://api.opendota.com/api/";
    dummyPlayerData = '22319665';
    
    require 'open-uri'
    shitresponse = URI.parse(serverIp+'players/'+dummyPlayerData+ '/heroes').read

 
    require 'json'
    require 'httparty'
    url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)

     
  end

  def index
   
  end
end


