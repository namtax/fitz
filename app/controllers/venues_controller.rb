class VenuesController < ApplicationController
  def index
    return @venues = [] unless params[:postcode]
    outcome = ::FindRacecoursesService.run(params[:postcode])
    if outcome.valid?
      @venues = outcome.result
    else
      flash.now[:alert] = outcome.errors.first
    end
  end
end