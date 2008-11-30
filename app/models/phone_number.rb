class PhoneNumber < ActiveRecord::Base
  acts_as_cute_admin :display_name => :phone_number, :index_columns => [
    :phone_number,
    :employee,
    {:employee => :company}
  ]
  belongs_to :employee
end
