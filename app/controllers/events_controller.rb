class EventsController < ApplicationController
  before_action do
    @activity = Activity.find_by(id: params[:id])
  end

  def index
    @activity = Activity.all
    @events = Event.all
    @calendar_events = @events.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Дата добавлена!' }
        format.json { render :show, status: :created, location: @event }
        format.js
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  private
  def event_params
    params.require(:event).permit(:activity_id, :start_time, :recurring)
  end
end
