class ActivitiesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @activities = Activity.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  def statistics
    @activities = Activity.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    #@activities = Activity.search_by_medium(params[:search]).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  private
  def sort_column
    Activity.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
