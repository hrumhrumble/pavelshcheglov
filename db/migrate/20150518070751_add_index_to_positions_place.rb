class AddIndexToPositionsPlace < ActiveRecord::Migration
  def change
    add_index :positions, :place
  end
end
