class Company < ActiveRecord::Base
  has_many :employees
  acts_as_cute_admin
end
