class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :latitude
      t.string :longitude
      t.string :complement
      t.references :postal_code, null: false
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
