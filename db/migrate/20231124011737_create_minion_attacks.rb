class CreateMinionAttacks < ActiveRecord::Migration[7.1]
  def change
    create_table :minion_attacks do |t|
      t.string :name
      t.string :description
      t.integer :damage
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
