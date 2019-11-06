class CreateCsvimporters < ActiveRecord::Migration[5.0]
  def change
    create_table :csvimporters do |t|
      t.string :pri
      t.text :question
      t.string :teaming
      t.integer :appears
      t.integer :frequency
      t.string :qtype
      t.string :role
      t.boolean :required
      t.string :conditions
      t.string :mapping
      t.string :sessionid, null: true

      t.timestamps
    end
  end
end
