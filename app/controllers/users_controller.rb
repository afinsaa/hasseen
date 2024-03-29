class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    load_and_authorize_resource
    def index
        @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
    end

    # PATCH/PUT /students/1 or /students/1.json
    def update
        respond_to do |format|
        if @user.update(user_params)
            format.html { redirect_to @user, notice: "user was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
        end
    end

    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit( :name, :email, :school_id,  roles: [])
    end
  end
  