# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!, exist: %i[index show]
  before_action :group, only: %i[edit]

  def index
    $flag = false
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def adduser
    $flag = true
    @candidate = group.candidates.build

    # @user = User.where(nickname: @candidate.name)
    # params[:enter][:user_id] = @user
    # params[:enter][:group_id] = @group.id
    # params[:enter][:permission] = true
    # @enter = Enter.create(enter_params)
    #       redirect_to group_path(@group.id)
  end

  def edit; end

  def update
    group.update(group_params)
    redirect_to group_path(group)
  end

  def destroy
    group.destroy
    redirect_to root_path
  end

  def show
    @enter = group.enters.find_by(user: current_user)

    @autor = group.user
    @articles = group.articles
    @events = group.events
  end

  def people
    @users = group.users
  end

  private

  def group
    @group ||= Group.find_by(id: params[:id]) || Group.find(params[:group_id])
  end

  def group_params
    params.require(:group).permit(:name, :context, :user_id)
  end
end
