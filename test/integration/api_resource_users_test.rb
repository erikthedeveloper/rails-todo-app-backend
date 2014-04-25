class ApiResourceUsers < ActionDispatch::IntegrationTest

    test 'GET users returns array of user objects' do
        get '/users', {}, {'Accept' => Mime::JSON}
        assert_equal 200, response.status
        json_body = body_to_json(response.body)
        assert_equal Mime::JSON, response.content_type
    end

    test 'POST users creates new user' do
        post '/users',
            { user:
                users(:joe)
            }.to_json, {'Accept' => Mime::JSON}

        assert_equal 201, response.status
        json_body = body_to_json(response.body)
    end

    test 'POST users multiple times causes error' do
        post '/users',
            { user:
                users(:joe)
            }.to_json, {'Accept' => Mime::JSON}

        post '/users',
            { user:
                users(:joe)
            }.to_json, {'Accept' => Mime::JSON}

        assert_not_equal 201, response.status
    end

end
