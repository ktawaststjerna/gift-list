class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy item_bought]
  before_action :get_family_users

  def index
    @items = current_user.family_items
  end

  def show
    render json: {}, status: :not_implemented
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # @item.user_id = current_user.id

    respond_to do |format|
      if @item.save!
        format.html { redirect_to controller: 'items', action: 'index' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to controller: 'items', action: 'index'}
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return render json: { error: 'Not Authorized' } unless permission

    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def item_bought
    return render json: { error: @item.errors }, status: :bad_request unless @item.buy_item(current_user.name)

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully bought.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(
      :name,
      :quantity,
      :colour,
      :size,
      :link,
      :detail,
      :item_bought,
      :user_id,
      :family_id
    )
  end

  def permission
    @item.user.id == current_user.id
  end

  def get_family_users
    @users = User.where(id: UsersToFamily.where(family_id: current_user.families.ids).pluck(:user_id))
  end
end
