class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    place = Place.find(params[:place_id])
    user = current_user
    comment.place = place
    comment.user = user
    comment.save!
    redirect_to place_path(place)
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :rating)
  end
end
