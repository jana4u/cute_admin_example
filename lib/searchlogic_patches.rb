# taken from http://github.com/binarylogic/searchlogic/raw/v1.6.6/lib/searchlogic/active_record/associations.rb

ActiveRecord::Associations::ClassMethods::InnerJoinDependency::InnerJoinAssociation.class_eval do
  private
    # Inner joins impose limitations on queries. They can be quicker but you can't do OR conditions when conditions
    # overlap from the base model to any of its associations. Also, inner joins won't allow you to order by an association
    # attribute. What if the association is optional? All of those records are ommitted. It just doesn't make sense to default
    # to inner joins when providing this as a "convenience" when searching. So let's change it.
    def join_type
      "LEFT OUTER JOIN"
    end
end


# http://github.com/jana4u/searchlogic/commit/72c169f3f8aaed163f8c7f8f77a97efa9805dc0b

module Searchlogic
  module NamedScopes
    module OrConditions
      private
        def or_conditions(name)
          # First determine if we should even work on the name, we want to be as quick as possible
          # with this.
          begin
            if (parts = split_or_condition(name)).size > 1
              conditions = interpolate_or_conditions(parts)
              if conditions.any?
                conditions
              else
                nil
              end
            end
          rescue Searchlogic::NamedScopes::OrConditions::UnknownConditionError
            if respond_to?(name)
              return nil
            else
              raise
            end
          end
        end
    end
  end
end
