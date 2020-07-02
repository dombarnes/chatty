class AddIndexRooms < ActiveRecord::Migration[4.2]
  def change
  	add_index :rooms, :uid, :unique => true
  end
end
