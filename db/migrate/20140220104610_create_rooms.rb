class CreateRooms < ActiveRecord::Migration[4.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :uid

      t.timestamps
    end
  end
end
