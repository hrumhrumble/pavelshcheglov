class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :place
      t.references :query, index: true

      t.timestamps null: false
    end
    add_foreign_key :positions, :queries
  end
end
