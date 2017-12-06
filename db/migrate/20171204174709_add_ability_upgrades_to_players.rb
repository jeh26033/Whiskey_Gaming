class AddAbilityUpgradesToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :ability_upgrades, :text
  end
end
