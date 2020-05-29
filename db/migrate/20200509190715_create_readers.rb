class CreateReaders < ActiveRecord::Migration[5.0]
  def change
    create_table :readers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
