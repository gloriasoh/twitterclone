class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :bio
      t.string :country
      t.date :birthday
      t.timestamps
    end
  end
end
