class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :order,            null: false, foreign_key: true
      t.string     :postal_code,      null: false
      t.integer    :delivery_area_id, null: false
      t.string     :area,             null: false
      t.string     :house_number,     null: false
      t.string     :building_name,    null: false
      t.string     :number,           null: false

      t.timestamps
    end
  end
end
