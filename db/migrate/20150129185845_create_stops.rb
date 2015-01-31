class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.belongs_to :station, index: true  
      t.belongs_to :line, index: true
      t.string :name
      t.time :time

   	 t.timestamps
    end
  end
end
