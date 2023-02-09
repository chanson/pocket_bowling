# frozen_string_literal: true

class CreateBracketSeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :bracket_seeds do |t|
      t.integer :bracket_event_participant_id
      t.integer :event_participant_id
      t.integer :bracket_number
      t.integer :bracket_session_id
      t.integer :seed
      t.boolean :alive, default: true

      t.timestamps

      t.index :bracket_event_participant_id
      t.index :event_participant_id
      t.index :bracket_session_id
    end
  end
end
