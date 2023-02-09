# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :event_series_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :team_size
      t.integer :handicap_base
      t.float :handicap_percent
      t.integer :max_handicap_score
      t.integer :total_games
      t.string :type

      t.timestamps

      t.index :event_series_id
      t.index :start_datetime
      t.index :end_datetime
    end
  end
end
