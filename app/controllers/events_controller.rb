class EventsController < ApplicationController
  before_action do
    @activity = Activity.find(params[:id])
  end

  def create
    @activity.events.build(event_params)
    if @event.save
      flash[:success] = "Дата добавлена!"
    end
  end


  private
  def event_params
    params.require(:event).permit(:activity_id, :date, :time)
  end
end
