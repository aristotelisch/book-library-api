class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn, unique: true
      t.boolean :visibility_status, default: true
      t.date :date_of_creation
      t.integer :sorting
      t.references :publisher, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
