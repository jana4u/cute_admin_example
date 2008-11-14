class PhoneNumber < ActiveRecord::Base
  belongs_to :employee
  acts_as_cute_admin :display_name => :phone_number
end
