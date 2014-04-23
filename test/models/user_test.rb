require 'test_helper'

class UserTest < ActiveSupport::TestCase

    # Enforces validation for fields
    test "Requires first_name, last_name, and email attributes" do
        user = User.create()
        assert !user.valid?, "User was created with invalid attributes!"
    end

    test 'User can have many projects' do
        user = User.create(first_name: 'Joe', email: 'joe@joe.com')
        user.projects.create([
            {title: 'The project..'},
            {title: 'The project..'}
            ])
        assert_equal 2, user.projects.count, "User should have 2 projects"
    end


end
