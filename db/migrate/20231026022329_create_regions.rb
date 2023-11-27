class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :code, null: false
      t.index :code, unique: true

      t.timestamps
    end
  end
end
