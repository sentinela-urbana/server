# frozen_string_literal: true

class CreatePostalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :postal_codes do |t|
      t.string :code
      t.string :neighbourhood
      t.string :city
      t.references :region, null: false

      t.timestamps
    end
  end
end
