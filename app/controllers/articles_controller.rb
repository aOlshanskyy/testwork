# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, exist: [:show]
  before_action :article, only: [:edit]

  def new
    @article = group.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if article.save
      redirect_to group_path(group.id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    article.update(article_params)
    redirect_to root_path
  end

  def destroy
    article.destroy
    redirect_to root_path
  end

  def show
    @comments = article.comments
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :body, :group_id)
  end

  def group
    @group ||= Group.find(params[:group_id])
  end

  def article
    @article ||= group.articles.find(params[:id]) if group
  end
end
