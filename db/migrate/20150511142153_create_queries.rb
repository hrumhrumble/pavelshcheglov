class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.text :queries
      t.references :site, index: true

      t.timestamps null: false
    end
    add_foreign_key :queries, :sites
  end
end
