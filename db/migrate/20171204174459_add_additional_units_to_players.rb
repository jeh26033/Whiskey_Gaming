class AddAdditionalUnitsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :additional_units, :text
  end
end
