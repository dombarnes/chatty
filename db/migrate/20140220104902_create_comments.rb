class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :name
      t.integer :room_id

      t.timestamps
    end
  end
end
