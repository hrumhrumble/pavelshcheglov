class ChangeColumnTypeInQuery < ActiveRecord::Migration
  def change
    change_column :queries, :word,  :string
  end
end
