class Employee < ActiveRecord::Base
  acts_as_cute_admin :display_name => :full_name_with_number, :order_by => [:last_name, :first_name, :employee_number],
    :index_columns => [
      :employee_number,
      :last_name,
      :first_name,
      :company,
      :manager,
      :emails,
      :phone_numbers
    ]
  belongs_to :company
  has_many :emails
  has_many :phone_numbers

  def full_name_with_number
    "#{last_name}, #{first_name} (#{employee_number})"
  end
end
