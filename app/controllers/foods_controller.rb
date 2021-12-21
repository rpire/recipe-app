class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.all
  end

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      flash[:notice] = 'Food removed!'
    else
      flash[:alert] = 'Failed to remove food!'
    end
    redirect_to foods_path
  end

  def create
    @food = current_user.foods.new(create_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:notice] = 'Food was successfully added.'
        else
          flash[:alert] = @food.errors.full_messages.first
        end
        redirect_to foods_path
      end
    end
  end

  private

  def create_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
