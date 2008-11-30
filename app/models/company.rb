class Company < ActiveRecord::Base
  acts_as_cute_admin :index_columns => [
    :name,
    :city,
    :country,
    :website,
    :employees
  ]
  has_many :employees
end
