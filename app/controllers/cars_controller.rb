class CarsController < ApplicationController
  include SearchCar

  def index
    @cars = Car.all
    @first = search(params[:search],params[:search2])
  end

  def create
    @car = Car.create(car_params)
    if @car.save
      flash[:success] = "car created"
      redirect_to cars_path
    else
      flash[:error] = "car failed to be create"
      redirect_to user_path(@car.user.id)
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(car_params)
      flash[:notice] = "Your rent has been record"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Your rent hasn't been record,
      make sur that the distance is a number,
      the duration rent is at list one day,
      it start in a futur date and the 'end_rent' is after the 'start_rent'"
      redirect_back(fallback_location: car_path(@car))
    end
  end

  def destroy
    car = Car.find(params[:id]).destroy
    flash[:success] = "Car deleted"
    redirect_to user_path(car.user.id)
  end

  private

  def car_params
    params.require(:car).permit(:name,
    :available_from, :available_to, :price_per_km, :price_per_day, :user_id,
    rents_attributes: [:id, :distance, :user_id, :start_rent, :end_rent, :_destroy])
  end
end
