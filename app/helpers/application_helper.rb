module ApplicationHelper

  def default_avatar(user)
    if user.photo.attached?
      image_tag(user.photo, width: 64, height: 64, class: 'avatar')
    else
      image_tag('http://www.gravatar.com/avatar/?d=retro', class: 'avatar')
    end
  end


  def default_cover(user)
    if user.cover_image.attached?
      image_tag(user.cover_image, width: 720, height: 240, class: 'cover-photo')
    else
      image_tag('https://picsum.photos/id/0/720/240', class: 'cover-photo')
    end
  end

  def like_or_dislike_btn(rant)
    like = Like.find_by(rant: rant, user: current_user)
    if like
      link_to('<i class="fa fa-heart" aria-hidden="true"></i>'.html_safe, rant_like_path(id: like.id, rant_id: rant.id), method: :delete, class: 'dislike')
    else
      link_to('<i class="far fa-heart" aria-hidden="true"></i>'.html_safe, rant_likes_path(rant_id: rant.id), method: :post, class: 'like')
    end
  end

  def follow_plus(user)
    if user != current_user
      if user.users_following.include?(current_user)
        link_to('<div class="icon"><i class="fas fa-times"></i></div>'.html_safe, user_unfollow_path(user.id), method: "DELETE", class: "follow-ex")
      else
        link_to('<div class="icon"><i class="fas fa-plus"></i></div>'.html_safe, user_follow_path(user.id), method: "POST", class: "follow-plus")
      end
    end   
  end

  def list_icon(user)
    if user != current_user
      '<div class="icon"><i class="fas fa-list-ul"></i></div>'.html_safe
    end    
  end

  def follow_plus2(user)
    if !current_user.followed_users.include?(user) && current_user != user
      link_to('<div class="icon"><i class="fas fa-plus"></i></div>'.html_safe, user_follow_path(user.id), method: "POST", class: "follow-er")
    end
  end
end
