module API
    class UsersController < ApplicationController

        def index
            @users = User.all
            render json: @users, status: :ok, root: false
        end

        def create
            @user = User.new(first_name: 'Joe', email: 'joejoe@joes.com')
            if @user.save
                render json: @user, status: :created, root: false
            else
                render json: @user.errors, status: :unprocessable_entity, root: false
            end
        end

        private
            def user_params
                params.require(:first_name).require(:email)
            end

    end
end