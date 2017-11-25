class ActivitiesController < ApplicationController
  def index
    @activities = Activity.paginate(page: params[:page])
  end
end
