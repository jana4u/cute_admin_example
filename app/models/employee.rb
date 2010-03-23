class Employee < ActiveRecord::Base
  acts_as_cute_admin :display_name => :full_name_with_number,
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

  named_scope :ascend_by_full_name_with_number, { :order => "last_name, first_name, employee_number" }
  named_scope :descend_by_full_name_with_number, { :order => "last_name DESC, first_name DESC, employee_number DESC" }
  named_scope :full_name_with_number_contains, lambda { |string| { :conditions => ["(employees.last_name LIKE ? OR employees.first_name LIKE ? OR employee_number LIKE ?)", "%#{string}%", "%#{string}%", "%#{string}%"] } }

  def full_name_with_number
    "#{last_name}, #{first_name} (#{employee_number})"
  end
end
