class CreateAssistances < ActiveRecord::Migration[7.0]
  def change
    create_table :assistances do |t|
      t.references :requested_by, null: false, foreign_key: { to_table: :users }
      t.references :answered_by, null: true, foreign_key: { to_table: :users }
      t.datetime :answered_at, null: true

      t.timestamps
    end
  end
end
