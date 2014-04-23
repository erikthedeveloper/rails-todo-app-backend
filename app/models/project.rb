class Project < ActiveRecord::Base

    # Relationships
    belongs_to :user

    # Validations
    validates_presence_of :title

    # Public

    # Private
end
