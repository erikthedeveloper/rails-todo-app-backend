require 'test_helper'

class UserTest < ActiveSupport::TestCase

    # Can have many projects

    # Enforces validation for fields
    test "Requires first_name, last_name, and email attributes" do
        user = User.create()
        assert !user.valid?, "User was created with invalid attributes!"
    end

end
