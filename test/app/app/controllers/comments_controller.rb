class CommentsController < ApplicationController
  
  respond_to :xml, :json

  include_resource :user
  
  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    @comment = Comment.find(params[:id])
    respond_with(@comment)
  end
  
end