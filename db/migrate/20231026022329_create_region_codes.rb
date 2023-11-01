class CreateRegionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :region_codes do |t|
      t.string :region_code, null: false
      t.index :region_code, unique: true

      t.timestamps
    end
  end
end
