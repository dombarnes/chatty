class AddIndexRooms < ActiveRecord::Migration
  def change
  	add_index :rooms, :uid, :unique => true
  end
end
