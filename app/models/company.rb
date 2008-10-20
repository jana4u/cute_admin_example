class Company < ActiveRecord::Base
  belongs_to :country
  has_many :developers
end
