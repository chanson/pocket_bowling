# frozen_string_literal: true

class CreateEventSeriesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_series_users do |t|
      t.integer :event_series_id
      t.integer :user_id
      t.string :roles, array: true, default: []
      t.boolean :contact
      t.string :email

      t.timestamps

      t.index [:event_series_id, :user_id]
      t.index :user_id
    end
  end
end
