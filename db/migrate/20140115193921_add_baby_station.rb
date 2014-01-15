class AddBabyStation < ActiveRecord::Migration
  def up
    add_column :reviews, :baby_station, :string
  end

  def down
    remove_column :reviews, :baby_station
  end
end
