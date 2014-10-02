module UsersHelper
  def user_avatar(user, options = {})
    options[:class] = "avatar thumbnail #{options[:class]}"
    - size = options.delete(:size) || 64
    link_to image_tag(user.avatar_url(size), class: 'media-object', style: "width:#{size}; height:#{size};"), user, options
  end
end
