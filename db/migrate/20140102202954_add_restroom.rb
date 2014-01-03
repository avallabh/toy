class AddRestroom < ActiveRecord::Migration
  def change
    create_table :restrooms do |t|
      t.float   :latitude,      null: false
      t.float   :longitude,     null: false
      t.string  :location_name, null: false
      t.string  :street_address
      t.string  :city
      t.string  :state
      t.string  :zip

      t.timestamps
    end
  end
end
