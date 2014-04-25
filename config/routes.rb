TddFirstShot::Application.routes.draw do

    namespace :api, path: '/', as: '' do
        resources :users
    end

end
