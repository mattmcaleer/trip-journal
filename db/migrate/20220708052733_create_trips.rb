class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.date :date
      t.text :details
      t.belongs_to :place
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
