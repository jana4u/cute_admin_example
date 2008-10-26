class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :street
      t.string :house_number
      t.string :city
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
