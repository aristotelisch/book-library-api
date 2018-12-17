class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name, unique: true
      t.string :telephone
      t.text :address

      t.timestamps
    end
  end
end
