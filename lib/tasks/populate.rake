namespace :db do
  desc "Erase and fill the database with test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Company, Employee, Email, PhoneNumber].each(&:delete_all)

    # Generates 4-15 companies with 1-50 employees.
    # Each employee has 1-6 emails and 1-5 phone numbers.
    Company.populate 4..15 do |company|
      company.name = Faker::Company.name
      domain = [company.name.gsub(/\W/, '').downcase, Faker::Internet.domain_suffix].join(".")
      company.website = ["www", domain].join(".")
      company.street = Faker::Address.street_name
      company.house_number = 1..1500
      company.city = Faker::Address.city
      company.zip_code = Faker::Address.zip_code
      company.country = Faker::Address.uk_country
      Employee.populate 1..50 do |employee|
        employee.company_id = company.id
        employee.employee_number = 1..999
        employee.first_name = Faker::Name.first_name
        employee.last_name = Faker::Name.last_name
        employee.age = 18..60
        employee.street = Faker::Address.street_name
        employee.house_number = 1..1500
        employee.city = Faker::Address.city
        employee.zip_code = Faker::Address.zip_code
        employee.country = Faker::Address.uk_country
        employee.manager = [true, false]
        employee.note =  ["", Faker::Lorem.paragraph]
        Email.populate 1..1 do |company_email|
          company_email.employee_id = employee.id
          company_email.email = [Faker::Internet.user_name("#{employee.first_name} #{employee.last_name}"), domain].join("@")
        end
        Email.populate 0..5 do |email|
          email.employee_id = employee.id
          email.email = Faker::Internet.free_email
        end
        PhoneNumber.populate 1..5 do |phone_number|
          phone_number.employee_id = employee.id
          phone_number.phone_number = Faker::PhoneNumber.phone_number
        end
      end
    end
  end
end