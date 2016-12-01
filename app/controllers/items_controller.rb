class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :item_bought]
  before_action only: [:destroy] {permission}

  def index
    families = current_user.families
    item_ids = []
    families.each do |family|
      family.items.each do |item|
        item_ids << item.id unless (item.item_bought == true && item.user.id != current_user.id)
      end
    end

    @items = Item.where(id: item_ids.uniq)
  end

  def show
    render json: {}, status: :not_implemented
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save

        current_user.to_pipes.each do |pipe|
          if pipe.from_type == "Family"
            Pipe.create(
              to_id: @item.id,
              to_type: "Item",
              from_id: pipe.from_id,
              from_type: "Family"
            )
          end
        end

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
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def item_bought
    @item.update(item_bought: true)
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
      params.require(:item).permit(:name, :quantity, :colour, :size, :link, :detail, :item_bought, :user_id, :family_id)
    end

    def permission
      return render json: {error: "Not Authorized"}, status: :unauthorized unless @item.user.id == current_user.id
    end
end
