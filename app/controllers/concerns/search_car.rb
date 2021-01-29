module SearchCar
  def search(search_start_rent, search_end_rent)
    if search_start_rent != nil && search_end_rent != nil
      @search_start_rent = search_start_rent.to_date
      @search_end_rent = search_end_rent.to_date
      if @search_start_rent >= @search_end_rent
        flash[:notice] = "The start date of the rent must be before the end date"
      elsif @search_start_rent <= Time.now
        flash[:notice] = "The start date must be in the futur"
      else
        check_availibility
      end
    end
  end

  def check_availibility
    results_availibility = []
    Car.all.each do |car|
      if @search_start_rent.between?(car.available_from, car.available_to) == true &&  @search_end_rent.between?(car.available_from, car.available_to) == true
        results_availibility << car
      end
    end
    check_if_already_rent_on_this_period(results_availibility)
  end

  def check_if_already_rent_on_this_period(results_availibility)
    @car_full_availibility = results_availibility
    results_availibility.each do |car|
      car.rents.each do |rent|
        car_array = []
        if @search_start_rent < rent.start_rent && @search_end_rent > rent.start_rent && @search_end_rent < rent.end_rent
          car_array << car
          @car_full_availibility -= car_array
        elsif rent.start_rent < @search_start_rent && @search_start_rent < rent.end_rent &&  rent.end_rent < @search_end_rent
          car_array << car
          @car_full_availibility -= car_array
        elsif @search_start_rent < rent.start_rent && rent.end_rent < @search_end_rent
          car_array << car
          @car_full_availibility -= car_array
        elsif rent.start_rent < @search_start_rent && @search_end_rent < rent.end_rent
          car_array << car
          @car_full_availibility -= car_array
        end
      end
    end
  end
end
