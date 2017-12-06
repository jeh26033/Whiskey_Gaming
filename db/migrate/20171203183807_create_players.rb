class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.references :match, foreign_key: true
      t.string :uid
      t.text :hero
      t.integer :level
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.integer :last_hits
      t.integer :denies
      t.integer :gold
      t.integer :gpm
      t.integer :xpm
      t.integer :status
      t.integer :gold_spent
      t.integer :hero_damage
      t.integer :tower_damage
      t.integer :hero_healing
      t.text :items
      t.integer :slot
      t.boolean :radiant

      t.timestamps
    end
  end
end
