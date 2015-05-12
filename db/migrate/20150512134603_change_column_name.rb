class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :queries, :queries, :word
  end
end
