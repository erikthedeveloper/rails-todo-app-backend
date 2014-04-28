module API
    class UsersController < BaseApiController

        def index
            @users = User.all
            render json: @users, status: :ok, root: false
        end

        def show
            @user = User.find(params[:id])
            render json: @user
        end

        def destroy
            if @user = User.find(params[:id])
                render json: @user.destroy, status: :ok
            end
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