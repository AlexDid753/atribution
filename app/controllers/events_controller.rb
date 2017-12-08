class EventsController < ApplicationController
  before_action do
    @activity = Activity.find_by(id: params[:id])
  end

  def create
    @event = @activity.events.create!(event_params)
    if @event.save
      flash[:success] = "Дата добавлена!"
      redirect_to(:back)
    end
  end


  private
  def event_params
    params.require(:event).permit(:date, :time)
  end
end
