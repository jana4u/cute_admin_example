class Company < ActiveRecord::Base
  acts_as_cute_admin
  belongs_to :country
  has_many :developers
end
