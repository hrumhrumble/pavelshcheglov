class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :sites, :users
  end
end
