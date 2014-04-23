class Project < ActiveRecord::Base

    # Relationships
    belongs_to :user
    has_many :tasks

    # Validations
    validates_presence_of :title, :user

    # Public

    # Private
end
