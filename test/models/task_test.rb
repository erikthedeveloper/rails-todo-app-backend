require 'test_helper'

class TaskTest < ActiveSupport::TestCase

    test 'Task belongs to project' do
        assert Task.first.project
    end

end
