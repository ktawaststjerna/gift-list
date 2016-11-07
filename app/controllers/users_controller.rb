class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    render json: {}, status: :not_implementedl
  end

  def show
    render json: {}, status: :not_implemented
  end

  def new
    render json: {}, status: :not_implemented
  end

  def create
    render json: {}, status: :not_implemented
  end

  def update
    render json: {}, status: :not_implemented
  end

  def destroy
    render json: {}, status: :not_implemented
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password_digest)
    end
end
