class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to dashboard_path, success: 'Event successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def event_params
    params[:event].permit(:name, :event_type, :start_datetime, :end_datetime, :handicap_base, :handicap_percent, :max_handicap_score, :total_games, :team_size)
  end
end
