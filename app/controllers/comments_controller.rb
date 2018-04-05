class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to comment.rehearsal
  end

  private

  def comment_params
    raise params.inspect
    params.require(:comment).permit(:content, :rehearsal_id, :student_id)
  end
end
