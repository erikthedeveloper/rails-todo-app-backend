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

    test 'Has many tasks' do
        project = User.create(first_name: 'Joe', email: 'joe@joe.com').projects.create(title: 'The project')
        project.tasks.create([
            {title: 'Task number 1'}, {title: 'Task number 2'}
            ])
        assert_equal 2, project.tasks.count, "Project should have 2 tasks"
    end

    test 'Tasks belonging to project are deleted when project is deleted' do
        project = User.create(first_name: 'Joe', email: 'joe@joe.com').projects.create(title: 'The project')
        tasks = project.tasks.create([
            {title: 'The task..'},
            {title: 'The task..'}
            ])
        project.destroy
        assert !Task.find_by_id(tasks.first.id), "Tasks should have been deleted along with project"
    end

end
