class User < ActiveRecord::Base

    # Relationships
    has_many :projects, dependent: :destroy

    # Validations
    validates_presence_of :first_name, :email
    validates_uniqueness_of :email

    # Public

    # Private
end
