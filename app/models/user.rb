require './lib/utils.rb'
class User < ApplicationRecord

  include Utils
  has_many :matches

	class<<self
    def from_omniauth(auth)
      info = auth['info']
      # Convert from 64-bit to 32-bit
      user = find_or_initialize_by(uid: (auth['uid'].to_i - 76561197960265728).to_s)
      user.nickname = info['nickname']
      user.avatar_url = info['image']
      user.profile_url = info['urls']['Profile']
      user.save!
      user
    end
  end

  def won?(match)
    player = find_self_in(match)
    (player.radiant? && match.winner == 'Radiant') || (!player.radiant? && match.winner == 'Dire')
  end

  def played_for_in(match)
    find_self_in(match).hero
  end

  def load_matches!(count)

    matches_arr = Dota.api.matches(player_id: self.uid, limit: count)
    if matches_arr && matches_arr.any?
      matches_arr.each do |match|
        unless self.matches.where(uid: match.id).any?
          match_info = nil
          loop do
            # Sometimes Steam API returns nothing in response
            match_info = Dota.api.matches(match.id)
            break if match_info && match_info.id
          end
          new_match = self.matches.create({
                                            uid: match.id,
                                            winner: match_info.winner.to_s.titleize,
                                            
                                            started_at: match_info.starts_at,
                                            mode: match_info.mode,
                                            
                                            duration: parse_duration(match_info.duration),
                                            match_type: match_info.type,
                                           
                                          })
          new_match.load_players!(match_info.radiant, match_info.dire)
        end
      end
    end
  end
    
  private



  def find_self_in(match)
    match.players.find_by(uid: uid)
  end

end
