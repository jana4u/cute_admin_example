class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.date :born_on
      t.integer :years_employed
      t.boolean :manager
      t.text :note
      t.references :company
      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
