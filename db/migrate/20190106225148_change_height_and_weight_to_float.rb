class ChangeHeightAndWeightToFloat < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :height, :decimal, default: 0.0
    remove_column :users, :weight, :decimal, default: 0.0

    add_column :users, :height, :float, default: 0.0
    add_column :users, :weight, :float, default: 0.0
  end
end
