# frozen_string_literal: true

class CreateEventSquads < ActiveRecord::Migration[7.0]
  def change
    create_table :event_squads do |t|
      t.integer :event_id
      t.integer :squad_number
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps

      t.index [:event_id, :squad_number]
    end
  end
end
