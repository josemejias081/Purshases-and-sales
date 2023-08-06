class EventsController < ApplicationController
  skip_authorization_check only: [:index, :show]
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
      redirect_to events_path, notice: "Event was successfully destroyed."
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:name, :description, :date, :location, :speaker, :portrait, :cost, :modality, :price, :status)
    end
end
