module ApplicationHelper
  def all_memos(object)
    render 'memos/all_memos', object: object
  end

  def profile_image(object, clas)
    render 'users/profile_image', object: object, clas: clas
  end

  def follow_btn(user)
    render 'users/follow_btn', user: user
  end
end
