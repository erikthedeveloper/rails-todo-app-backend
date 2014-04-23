require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

    test 'Must belong to a user' do
        # Create a project without a user
        project = Project.create(user: nil, title: 'A project title', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, autem tempore reiciendis officiis velit non veniam minus modi nobis iure.')
        assert !project.valid?, "Project was created without belonging to any user...."
    end

    test 'Belongs to a user' do
        user    = User.create(first_name: 'Joe', email: 'joe@joe.com')
        project = user.projects.create(title: 'The project')
        assert project.valid?, "Project was not created successfully..."
    end


end
