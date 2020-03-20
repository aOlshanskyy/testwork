class ArticlesController < ApplicationController
	before_action :authenticate_user!, exist:[:show]
	before_action :set_group
      
	def new
      @article = Article.new
	end

	def create
		params[:article][:group_id] = @group.id
		params[:article][:user_id] = current_user.id
        @article = Article.create(article_params)
        if @article.save
      	  redirect_to group_path(@group.id)
        else
      	  render 'new'
        end
     
	end

	def edit
		
	end

	def update
	  @article.update(article_params)
	  redirect_to root_path	
	end

	def destroy
	  @article.destroy
	  redirect_to root_path
	end

	def show
		@article = Article.find(params[:id])
		@comments = Articlescoment.where(article_id: @article.id)
		
	end


	private

	def article_params
	pp  params.require(:article).permit(:user_id, :title, :body, :group_id)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_article
		@article=Article.find(params[:id])
	end
end
