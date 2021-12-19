class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.integer :number
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
