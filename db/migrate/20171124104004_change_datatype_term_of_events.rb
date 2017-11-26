class ChangeDatatypeTermOfEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :term, :datetime
  end
end
