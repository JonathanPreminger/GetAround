class UsersController < ApplicationController

  def show
   @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.email} was successfully updated."
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(5)
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email,
    cars_attributes: [:id, :name, :price_per_km, :price_per_day,
    :available_from, :available_to, :_destroy])
  end

end
