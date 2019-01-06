class SetDefaultHeightAndWeight < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :height, from: nil, to: 0
    change_column_default :users, :weight, from: nil, to: 0
  end
end
