namespace :db do
  desc "Erase and fill the database with test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Country, Company, Developer].each(&:delete_all)

    # Generates 4-15 countries with 0-10 companies.
    # Each company has 0-15 developers..
    Country.populate 4..15 do |country|
      country.name = Faker::Address.uk_country
      country.currency = Populator.words(1).titleize
      #country.created_at = 5.years.ago..Time.now
      Company.populate 0..10 do |company|
        company.country_id = [nil, country.id]
        company.name = Faker::Company.name
        #company.created_at = country.created_at..Time.now
        Developer.populate 0..15 do |developer|
          developer.company_id = company.id
          developer.first_name = Faker::Name.first_name
          developer.years_employed = 0..15
          developer.last_name = Faker::Name.last_name
          #developer.born_on = 55.years.ago..20.years.ago
          developer.manager = [true, false]
          developer.note =  Faker::Lorem.paragraph
          #developer.created_at = company.created_at..Time.now
        end
      end
    end
  end
end