class CommentsController < ApplicationController
  before_action :require_signin

  def create
  	@product = Product.find(params["product_id"])
  	@comment = @product.comments.build(comment_params)
    @comment.user = current_user
  	if @comment.save
      flash[:notice] = "comment has been created"
  		redirect_to @product
    else
      @comments = @product.comments
      render "products/show"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end