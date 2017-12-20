class Player < ApplicationRecord
	
	belongs_to :match
	has_many :match
	
	serialize :hero
	serialize :items
	serialize :additional_units
    serialize :ability_upgrades

	def abandoned_or_not_connected?
		status != 'played'
	end
end
