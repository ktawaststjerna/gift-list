class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def index
    render json: {}, status: :not_implemented
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
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name)
    end
end
