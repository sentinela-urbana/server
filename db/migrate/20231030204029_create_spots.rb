# frozen_string_literal: true

class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.references :region, null: false
      t.timestamps
    end
  end
end
