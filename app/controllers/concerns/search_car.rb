module SearchCar
  def search(search_start_rent, search_end_rent)
    if search_start_rent != nil && search_end_rent != nil
      @results_search_car = []
      @search_start_rent = search_start_rent.to_date
      @search_end_rent = search_end_rent.to_date
      if @search_start_rent >= @search_end_rent
        flash[:notice] = "The start date of the rent must be before the end date"
      elsif @search_start_rent <= Time.now
        flash[:notice] = "The start date must be in the futur"
      else
        Car.all.each do |car|
          if @search_start_rent.between?(car.available_from, car.available_to) == true &&  @search_end_rent.between?(car.available_from, car.available_to) == true
            @results_search_car << car
          end
        end
      end
    end
  end
end
