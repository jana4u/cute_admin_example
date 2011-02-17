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
