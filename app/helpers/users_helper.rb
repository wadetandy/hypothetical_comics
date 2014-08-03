module UsersHelper
  def user_avatar(user, options = {})
    options[:class] = "thumbnail avatar #{options[:class]}"
    link_to image_tag(asset_path('default-user-avatar.png'), class: 'media-object'), user, options
  end
end
