class CreateSurveillanceRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :surveillance_regions do |t|
      t.references :region, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
