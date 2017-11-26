class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.string :image
      t.string :pick
      t.time :term
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
