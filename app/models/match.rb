require './lib/utils'
class Match < ApplicationRecord
  include Utils

 
  belongs_to :user
  has_many :players, dependent: :delete_all
  serialize :towers_status
  serialize :barracks_status

  def load_players!(radiant, dire)
    roster = {radiant: radiant, dire: dire}
    roster.each_pair do |k, v| #iterates through teams
      v.players.each do |player|
        self.players.create({
                              uid: player.id,
                              items: player.items.delete_if {
                                  |item| item.name == "Empty"
                              }.map  {
                                  |item| {id: item.id, name: item.name, image: item.image_url}
                              },

                              hero: {id: player.hero.id,
                                     name: player.hero.name,
                                     image: player.hero.image_url},
                                     
                              level: player.level,
                              kills: player.kills,
                              deaths: player.deaths,
                              assists: player.assists,
                              last_hits: player.last_hits,
                              denies: player.denies,
                              gold: player.gold,
                              gpm: player.gpm,
                              xpm: player.xpm,
                              status: player.status.to_s.titleize,
                              gold_spent: player.gold_spent,
                              hero_damage: player.hero_damage,
                              tower_damage: player.tower_damage,
                              hero_healing: player.hero_healing,
                              slot: player.slot,
                              radiant: k == :radiant
                          })
	    end
	  end
	end


  private

  def parse_items(items)
    items.delete_if {
      |item| item.name == "Empty"
    }.map  {
      |item| {id: item.id, name: item.name, image: item.image_url}
    }
  end
end
