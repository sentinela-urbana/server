class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :taxpayer_registry, null: false, index: true
      t.string :email, null: false, index: true, unique: true
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :role, null: false
      t.string :address
      t.string :streetNumber
      t.string :phone
      t.datetime :birth_date
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token, index: true, unique: true
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at


      t.timestamps
    end
  end
end
