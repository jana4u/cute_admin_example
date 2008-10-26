class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.string :phone_number
      t.references :employee

      t.timestamps
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
