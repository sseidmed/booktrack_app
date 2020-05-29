class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :shelf
      t.string :review
      t.references :reader, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
