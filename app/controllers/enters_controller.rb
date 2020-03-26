class EntersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group
	before_action :set_enter, only:[:destroy]


	def create
		if $flag == false
			@enter = Enter.create(user_id: current_user.id, group_id: @group.id, permission: true)
			if @enter.save
				redirect_to group_path(@enter.group_id)
			else
			
			end
		else
			@candidate = Candidate.last
			@user = User.where(nickname: @candidate.name).last
			@enter = Enter.create(user_id: @user.id, group_id: @group.id, permission: true)
			redirect_to group_path(@enter.group_id)
		end
	end

	def destroy
		@enter.destroy
		redirect_to root_path
	end
	private

	def enter_params
		pp  params.require(:enter).permit(:user_id, :group_id, :permission)
	end

	def set_enter
		@enter = Enter.find(params[:id])
	end

	def set_group
		@group = Group.find(params[:group_id])
	end
end
