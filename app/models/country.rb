class Country < ActiveRecord::Base
  acts_as_cute_admin
  has_many :companies
end
