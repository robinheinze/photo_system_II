class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Your friend has been tagged!"
      redirect_to user_path(@tag.post.user)
    else
      render edit_user_post(@tag.post.user, @tag.post)
    end
  end

private
  def tag_params
    params.require(:tag).permit(:user_id, :post_id)
  end
end
