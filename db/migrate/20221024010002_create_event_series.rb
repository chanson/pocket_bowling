# frozen_string_literal: true

class CreateEventSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :event_series do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :primary_type
      t.integer :team_size
      t.integer :handicap_base
      t.float :handicap_percent
      t.integer :max_handicap_score

      t.timestamps
      t.index :start_datetime
      t.index :end_datetime
    end
  end
end
