class Developer < ActiveRecord::Base
  acts_as_cute_admin :display_name => :full_name, :order_by => [:last_name, :first_name]
  belongs_to :company

  def full_name
    "#{last_name}, #{first_name}"
  end
end
