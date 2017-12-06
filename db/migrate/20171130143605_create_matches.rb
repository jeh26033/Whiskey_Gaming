class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :uid
      t.string :winner
      t.datetime :started_at
      t.string :mode
      t.string :match_type
      t.string :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
