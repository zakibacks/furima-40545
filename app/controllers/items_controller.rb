class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_tweet, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path, alert: "You are not authorized to edit this item."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id,
                                 :product_condition_id, :delivery_price_id, :delivery_area_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end
