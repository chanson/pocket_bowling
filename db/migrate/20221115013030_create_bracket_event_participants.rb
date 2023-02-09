class CreateBracketEventParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :bracket_event_participants do |t|
      t.integer :event_participant_id
      t.integer :total_brackets
      t.integer :bracket_session_id

      t.timestamps

      t.index :event_participant_id
      t.index :bracket_session_id
    end
  end
end
