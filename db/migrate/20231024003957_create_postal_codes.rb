# frozen_string_literal: true

class CreatePostalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :postal_codes do |t|
      t.string :postal_code
      t.string :neighbourhood
      t.string :city
      t.string :region_code

      t.timestamps
    end
  end
end
