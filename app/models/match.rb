class Match < ActiveRecord::Base
  include Utils
  belongs_to :user
  has_many :players, dependent: :delete_all
  serialize :towers_status
  serialize :barracks_status

  def load_players!(radiant, dire)
    logger.debug"started load_players function from user model"
    roster = {radiant: radiant, dire: dire}
    roster.each_pair do |k, v|
      v.players.each do |player|
        self.players.create({
                              uid: player.id,
                              items: parse_items(player.items),
                              hero: {id: player.hero.id,
                                     name: player.hero.name,
                                     image: player.hero.image_url(:sb)
                              },
                              ability_upgrades: player.ability_upgrades.map {
                                |ability_upgrade| {id: ability_upgrade.ability.id,
                                                   name: ability_upgrade.ability.name,
                                                   image: ability_upgrade.ability.image_url(:hp1),
                                                   level: ability_upgrade.level,
                                                   time: parse_duration(ability_upgrade.time)}
                              }.sort_by {|ability_upgrade| ability_upgrade[:level]},
                              additional_units: player.additional_units.map {
                                |unit| {name: unit.name,
                                        items: parse_items(unit.items)}
                              },
                              level: player.level,
                              kills: player.kills,
                              deaths: player.deaths,
                              assists: player.assists,
                              last_hits: player.last_hits,
                              denies: player.denies,
                              gold: player.gold,
                              gpm: player.gpm,
                              xpm: player.xpm,
                              status: player.status,
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

  
end