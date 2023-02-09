class CreateEventParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :event_participants do |t|
      t.integer :event_series_user_id
      t.integer :event_id
      t.integer :event_squad_id
      t.integer :scores, array: true, default: []
      t.integer :handicap
      t.integer :prize

      t.timestamps

      t.index :event_series_user_id
      t.index :event_squad_id
      t.index :event_id
    end
  end
end
