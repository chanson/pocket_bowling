class AddNameToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.string :name
    end
  end
end
