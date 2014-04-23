class User < ActiveRecord::Base

    # Relationships
    has_many :projects

    # Validations
    validates_presence_of :first_name, :email

    # Public

    # Private
end
