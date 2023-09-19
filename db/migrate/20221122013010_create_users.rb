class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :taxpayer_registry
      t.datetime :birth_date
      t.string :address
      t.string :streetNumber
      t.string :phone
      t.string :nome

      t.timestamps
    end
  end
end
