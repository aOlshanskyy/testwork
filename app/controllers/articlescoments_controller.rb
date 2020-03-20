class ArticlescomentsController < ApplicationController

	def create
		params[:articlescoment][:article_id] = params[:article_id]
		params[:articlescoment][:user_id] = current_user.id
		@articlescoment = Articlescoment.create(articlescoments_params)
		if @articlescoment.save
			redirect_to group_article_path(:group_id, :article_id)
		else
			@articlescoment.errors.full_messages.each do |msg|
				@msg = msg
		end  
    	flash[:notice] = "#{@msg}"
    	redirect_to group_article_path(params[:article_id])
	    end
	end

	private
	def articlescoments_params
		params.require(:articlescoment).permit(:user_id, :article_id, :textofcom)
	
	end

end
