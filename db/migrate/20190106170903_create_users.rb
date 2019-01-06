class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :first_name
      t.string :last_name
      t.decimal :height
      t.decimal :weight

      t.timestamps
    end
  end
end
