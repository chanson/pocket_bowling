# frozen_string_literal: true

class CreateBracketSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :bracket_sessions do |t|
      t.integer :event_id
      t.integer :event_squad_id
      t.integer :size
      t.float :cost
      t.string :type
      t.jsonb :payouts, null: false, default: '{}'
      t.integer :starting_game
      t.boolean :reverse, default: false

      t.timestamps
    end
  end
end
