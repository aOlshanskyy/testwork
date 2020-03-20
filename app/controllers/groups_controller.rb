class GroupsController < ApplicationController
	before_action :authenticate_user!, exist:[:show]

	def index
		$flag = false
		@groups = Group.all	
		
	end
      
	def new
      @group = Group.new
	end

	def create	
        @group = current_user.groups.build(group_params)
        if @group.save
      	  redirect_to root_path
        else
      	  render 'new'
        end
      
	end

	def adduser
		@candidate = Candidate.new
		@gr = @candidate.group_id
		$flag = true
		@enter = Enter.create
	
		# @user = User.where(nickname: @candidate.name)
		# params[:enter][:user_id] = @user
		# params[:enter][:group_id] = @group.id
		# params[:enter][:permission] = true 
		# @enter = Enter.create(enter_params)
  #     	redirect_to group_path(@group.id)
      
	end

	def edit
		
	end

	def update
	  @group.update(group_params)
	  redirect_to root_path	
	end

	def destroy
	  @group.destroy
	  redirect_to root_path
	end

	def show
		pp	@group = Group.find(params[:id])
		@enters = Enter.where(user_id: current_user, group_id: @group.id ).first
	
		@users = User.all
		@autor = @users.where(id: @group.user_id)
		@articles = Article.where(group_id: @group.id)
		@events = Event.where(group_id: @group.id)

	end


	private

	def group_params
	pp  params.require(:group).permit(:name, :context, :user_id)
	end

end
