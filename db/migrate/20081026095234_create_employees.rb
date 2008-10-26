class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :employee_number
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :street
      t.string :house_number
      t.string :city
      t.string :zip_code
      t.string :country
      t.text :note
      t.boolean :manager
      t.references :company

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
