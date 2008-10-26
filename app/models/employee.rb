class Employee < ActiveRecord::Base
  belongs_to :company
  acts_as_cute_admin :display_name => :full_name_with_number, :order_by => [:last_name, :first_name, :employee_number]

  def full_name_with_number
    "#{last_name}, #{first_name} (#{employee_number})"
  end
end
