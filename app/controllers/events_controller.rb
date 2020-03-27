# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_group
  def new
    @event = Event.new
  end

  def create
    params[:event][:group_id] = @group.id
    params[:event][:user_id] = current_user.id
    @event = Event.create(event_params)
    if @event.save
      redirect_to group_path(@group.id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :evname, :day, :group_id, :context)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
