{
  :en => {
    :date => {
      :formats => {
        :long_ordinal => lambda { |date| "%B #{date.day.ordinalize}, %Y" }
      }
    },
    :time => {
      :formats => {
        :default  => "%Y-%m-%d %H:%M",
        :long_ordinal => lambda { |time| "%B #{time.day.ordinalize}, %Y %H:%M" },
        :time_only => "%H:%M"
      },
      :time_with_zone => {
        :formats => {
          :default => lambda { |time| "%Y-%m-%d %H:%M:%S #{time.formatted_offset(false, 'UTC')}" }
        }
      },
      :am => 'am',
      :pm => 'pm'
    },
    # date helper distance in words
    #NOTE: Pluralization rules have changed! Rather than simply submitting an array, i18n now allows for a hash with the keys:
    # :zero, :one & :other   - FUNKY (but a pain to find...)!
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => 'half a minute',
        :less_than_x_seconds => {:zero => 'less than 1 second', :one => '1 second', :other => '{{count}} seconds'},
        :x_seconds           => {:one => '1 second', :other => '{{count}} seconds'},
        :less_than_x_minutes => {:zero => 'less than a minute', :one => '1 minute', :other => '{{count}} minutes'},
        :x_minutes           => {:one => "1 minute", :other => "{{count}} minutes"},
        :about_x_hours       => {:one => 'about 1 hour', :other => '{{count}} hours'},
        :x_days              => {:one => '1 day', :other => '{{count}} days'},
        :about_x_months      => {:one => 'about 1 month', :other => '{{count}} months'},
        :x_months            => {:one => '1 month', :other => '{{count}} months'},
        :about_x_years       => {:one => 'about 1 year', :other => '{{count}} years'},
        :over_x_years        => {:one => 'over 1 year', :other => '{{count}} years'}
      }
    },

    # numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => '.',
        :delimiter => ','
      },
      :currency => {
        :format => {
          :unit => '$',
          :precision => 2,
          :format => '%u %n'
        }
      }
    },

    # Active Record
    :activerecord => {
      :errors => { 
        :template => {
          :header => {
            :one => "Couldn't save this {{model}}: 1 error", 
            :other => "Couldn't save this {{model}}: {{count}} errors."
          },
          :body => "Please check the following fields:"
        },
        :messages => {
          :inclusion => "is not included in the list",
          :exclusion => "is not available",
          :invalid => "is not valid",
          :confirmation => "does not match its confirmation",
          :accepted  => "must be accepted",
          :empty => "must be given",
          :blank => "must be given",
          :too_long => "is too long (no more than {{count}} characters)",
          :too_short => "is too short (no less than {{count}} characters)",
          :wrong_length => "is not the right length (must be {{count}} characters)",
          :taken => "is not available",
          :not_a_number => "is not a number",
          :greater_than => "must be greater than {{count}}",
          :greater_than_or_equal_to => "must be greater than or equal to {{count}}",
          :equal_to => "must be equal to {{count}}",
          :less_than => "must be less than {{count}}",
          :less_than_or_equal_to => "must be less than or equal to {{count}}",
          :odd => "must be odd",
          :even => "must be even"
        }
      },
      :models => { 
        :employee => { 
          :one => "Employee",
          :other => "Employees",
        },
        :company => {
          :one => "Company",
          :other => "Companies",
        },
        :phone_number => {
          :one => "Phone number",
          :other => "Phone numbers",
        },
        :email => {
          :one => "Email",
          :other => "Emails",
        },
      },
      :attributes => {
        :employee => {
          :first_name => "First name",
          :last_name => "Surname",
          :email => "Email",
          :password => "Secret",
          :employee_number => "Employee #"
        }
      }
    },
    :txt => {
      :choose_language => "Choose Language",
      :example => "Example",
      :more => "For more information about cute_admin plug-in see",
      :get_example => "This sample application can be found at",
    }
  }
}