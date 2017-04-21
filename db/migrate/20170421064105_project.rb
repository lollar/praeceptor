class Project < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false, unique: true
      t.text :requirements, null: false

      t.timestamps
    end
  end
end
