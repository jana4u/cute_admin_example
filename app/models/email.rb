class Email < ActiveRecord::Base
  acts_as_cute_admin :display_name => :email, :index_columns => [
    :email,
    :employee,
    {:employee => :company}
  ]
  belongs_to :employee
end
